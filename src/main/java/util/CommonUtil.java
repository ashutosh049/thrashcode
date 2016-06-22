package util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;

import models.Article;
import models.Comment;
import models.GenericWithImage;

public class CommonUtil{

	
	@Value("${chars}") private  String chars;
	@Value("${cmt_filePath}") private String cmt_filePath;
	@Value("${tmpFileSrcPath}") private String tmpFileSrcPath;
	@Value("${tmpFileDescPath}") private String tmpFileDescPath;
	private JdbcTemplate jdbcTemplate;

	
	private static final Logger logger = LoggerFactory.getLogger(CommonUtil.class);
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public static final Map<String, Long> times = new LinkedHashMap<String, Long>();
	 static {
	        times.put("year", TimeUnit.DAYS.toMillis(365));
	        times.put("month", TimeUnit.DAYS.toMillis(30));
	        times.put("week", TimeUnit.DAYS.toMillis(7));
	        times.put("day", TimeUnit.DAYS.toMillis(1));
	        times.put("hour", TimeUnit.HOURS.toMillis(1));
	        times.put("minute", TimeUnit.MINUTES.toMillis(1));
	        times.put("second", TimeUnit.SECONDS.toMillis(1));
	    }

	public String generateDonorId(String argDonorName) {
		String query = "SELECT COUNT(*) FROM details_donor";
		int donorCount = jdbcTemplate.queryForInt(query);
		String donorId = "DNR_" + donorCount + "_" + argDonorName.substring(0, 5);
		logger.info("method : generateDonorId with argDonorName = ["+argDonorName+"], and donorId = ["+donorId+"].");
		return donorId;
	}

	public String generateDonorPassword(String argDonorName, int argBirthDate, int argBirthMonth) {
		Random random = new Random();
		String temp = "";
		for (int i = 0; i < 5; i++) {
			temp += chars.charAt(random.nextInt(chars.length())) + random.nextInt(20);
		}
		String passsword = argDonorName + temp + "@" + argBirthDate + "/" + argBirthMonth;
		logger.info("method : generateDonorPassword with argDonorName = ["+argDonorName+"], and passsword = ["+passsword+"].");
		return passsword;
	}

	public boolean createDataFile(String argArtclId, String argCmtId, String argCmtData, String argFilePath, String argFileName) throws IOException {

		File file = new File(argFilePath+"/"+argFileName);
		logger.info("\n\n----"
				+ "@mthd : createDataFile()"+"\n"
				+ "@arg :argArtclId :"+argArtclId+"\n"
				+ "@arg :argCmtId :"+argCmtId+"\n"
				+ "@arg :argCmtData :"+argCmtData+"\n"
				+ "@arg :argCmt_filePath :"+argFilePath+"\n"
				+ "@arg :argCmt_fileName :"+argFileName+"\n");
		
		if (!file.exists()) {
			if (new File(argFilePath).mkdirs()) {
				System.out.println("["+argFilePath+"] Directory created!");
				file = new File(argFilePath+"/"+argFileName);
			} else {
				System.out.println("Failed to create directory. Already exists....!");
			}

			file.createNewFile();
			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(argCmtData);
			bw.close();

			return true;
		} else {
			return false;
		}
	}

	public List<Comment> getCmtData(List<Comment> argCommentsList) {
		
		logger.info("\n\n----"
				+ "@mthd : getCmtData()"+"\n"
				+ "@arg :argCommentsList :"+argCommentsList+"\n");
		
		if (argCommentsList.size() > 0) {
			for (Comment comment : argCommentsList) {
				BufferedReader br = null;

				try {

					String sCurrentLine;

					br = new BufferedReader(new FileReader(comment.getCmt_filePath()+"/"+comment.getCmnt_id()+".txt"));

					String data = "";
					while ((sCurrentLine = br.readLine()) != null) {
						data += sCurrentLine;
					}
					comment.setCmt_data(data);
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						if (br != null)
							br.close();
					} catch (IOException ex) {
						ex.printStackTrace();
					}
				}

			}
			return argCommentsList;
		} else {
			return null;
		}
	}
	
	public List<GenericWithImage> bundleCommentToGenericWithImg(List<Comment> argCommentList){
		logger.info("\n\n----"
				+ "@mthd : bundleCommentToGenericWithImg()"+"\n"
				+ "@arg  : argCommentList :"+argCommentList+"\n");
		List<GenericWithImage> genericDataList = new LinkedList<GenericWithImage>();
		
		if(argCommentList.size() > 0){
			for (Comment comment : argCommentList) {
				genericDataList.add(new GenericWithImage(comment, null,null,null,getTimeAgo(comment.getCmt_date(), new Date())));
			}
		}
		return genericDataList;
	}
	
	public List<GenericWithImage> bundleArticleToGenericWithImg(List<Article> argArticleList){
		logger.info("\n\n----"+ "@mthd : bundleCommentToGenericWithImg()"+"\n"+ "@arg  : argCommentList :"+argArticleList+"\n");
		List<GenericWithImage> genericDataList = new LinkedList<GenericWithImage>();
		
		if(argArticleList.size() > 0){
			for (Article  article: argArticleList) {
//				genericDataList.add(new GenericWithImage(article, null,null,null, getTimeAgo(article.getArtcle_lastUpdateDate(), new Date())));
				genericDataList.add(new GenericWithImage(article, null,null,null, toRelative(article.getArtcle_lastUpdateDate(), new Date())));
				
			}
		}
		return genericDataList;
	}

	public Article getAtclData(Article argArticle) {

		logger.info("\n\n----"+ "@mthd : getAtclData()"+"\n"+ "@arg  :argArticle :"+argArticle.toString()+"\n");
		
			String data = "";
			BufferedReader br = null;
			try {

				String sCurrentLine;

				br = new BufferedReader(new FileReader(argArticle.getArtcle_filePath()));

				while ((sCurrentLine = br.readLine()) != null) {
					data += sCurrentLine;
				}
				argArticle.setArtcle_Data(data);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (br != null)
						br.close();
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}
			return argArticle;
	}

	public void copyFileTemprarily() {
//		String tmpFileSrcPath = "C:/poscode_REPO/poscode_REPO_ARCTL/poscode_REPO_ARCTL_CONTS/artcl_001/Locks.html";
//		String tmpFileDescPath = "E:/APPUSECASES/RedEyeBloodBank/src/main/webapp/WEB-INF/views/tmp.jsp";
		
		logger.info("\n\n----"
				+ "@mthd : copyFileTemprarily()"+"\n");
		
		FileInputStream instream = null;
		FileOutputStream outstream = null;
		try {
			File infile = new File(tmpFileSrcPath);
			File outfile = new File(tmpFileDescPath);
			instream = new FileInputStream(infile);
			outstream = new FileOutputStream(outfile);
			byte[] buffer = new byte[1024];
			int length;
			while ((length = instream.read(buffer)) > 0) {
				outstream.write(buffer, 0, length);
			}
			instream.close();
			outstream.flush();
			outstream.close();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
/*	public String createTempDirectory() throws IOException{
		logger.info("\n\n----"
				+ "@mthd : createTempDirectory()");
		Path predefinedPath = Paths.get("C:/poscode_REPO");
		Path path = Files.createTempDirectory(predefinedPath,"");
		return path.toString();
	}*/
	
	public File copyUploadedFileToTemp(File argImagFile, String tempPath) throws IOException{
		logger.info("\n\n----"
				+ "@mthd : copyUploadedFileToTemp()"+"\n"
				+ "@arg  : argImagFile :"+argImagFile.getName()+"\n"
				+ "@arg  : tempPath :"+tempPath+"\n");
		FileInputStream fis = new FileInputStream(argImagFile);
		String autogenerateFileNAme = "image_"+new Random(9999999).nextLong()+99999+FilenameUtils.getExtension(argImagFile.getName());
		File targetFile = new File(tempPath+autogenerateFileNAme);
		FileUtils.copyInputStreamToFile(fis, targetFile);
		return targetFile;
	}
	
	public boolean ifDirExists(String argCompleteDirPath){
		logger.info("\n\n----"
				+ "@mthd : ifFileExists()"+"\n"
				+ "@arg  : argCompleteDirPath :"+argCompleteDirPath+"\n");
		File dir  = new File(argCompleteDirPath);
		if(!dir.exists())
			return false;
		return true;
	}
	
	public boolean createDir(String argCompleteDirPath){
		return new File(argCompleteDirPath).mkdir();
	}
	
	public boolean createFile(String argCmpltFileName){
		try {
		      File file = new File(argCmpltFileName);
		      if (file.createNewFile()){
		        return true;
		      }else{
		    	  return false;
		      }
	    	} catch (IOException e) {
		      e.printStackTrace();
	   }
		return false;
	}
	
	public String getTimeAgo(Date argStartDate, Date argEndDate){

	    long diffInSeconds = (argEndDate.getTime() - argStartDate.getTime()) / 1000;

	    long diff[] = new long[] { 0, 0, 0, 0, 0, 0 };
	    /* sec */diff[5] = (diffInSeconds >= 60 ? diffInSeconds % 60 : diffInSeconds);
	    /* min */diff[4] = (diffInSeconds = (diffInSeconds / 60)) >= 60 ? diffInSeconds % 60 : diffInSeconds;
	    /* hours */diff[3] = (diffInSeconds = (diffInSeconds / 60)) >= 24 ? diffInSeconds % 24 : diffInSeconds;
	    /* days */diff[2] = (diffInSeconds = (diffInSeconds / 24));
	    /* months */diff[1] = (diffInSeconds = (diffInSeconds / 30));
	    /* years */diff[0] = (diffInSeconds = (diffInSeconds / 12));
	    String timeAgo = String.format(
	    		"%d year%s, %d month%s, %d day%s, %d hour%s, %d minute%s, %d second%s ago",
	    		diff[0],
		        diff[0] > 1 ? "s" : "",
	    		diff[1],
		        diff[2] > 1 ? "s" : "",
	    		diff[2],
		        diff[2] > 1 ? "s" : "",
		        diff[3],
		        diff[3] > 1 ? "s" : "",
		        diff[4],
		        diff[4] > 1 ? "s" : "",
		        diff[5],
		        diff[5] > 1 ? "s" : "");
		return timeAgo;
	}

	public static String toRelative(Date start, Date end){
        assert start.after(end);
        return toRelative(end.getTime() - start.getTime());
    }
	public static String toRelative(long duration, int maxLevel) {
        StringBuilder res = new StringBuilder();
        int level = 0;
        for (Map.Entry<String, Long> time : times.entrySet()){
            long timeDelta = duration / time.getValue();
            if (timeDelta > 0){
                res.append(timeDelta)
                .append(" ")
                .append(time.getKey())
                .append(timeDelta > 1 ? "s" : "");
                        //.append(" ago ");
                /*duration -= time.getValue() * timeDelta;
                level++;*/
                break;
            }
            if (level == maxLevel){
                break;
            }
        }
        if ("".equals(res.toString())) {
            return "few seconds ago";
        } else {
            //res.setLength(res.length() - 2);
            res.append(" ago");
            return res.toString();
        }
    }

    public static String toRelative(long duration) {
        return toRelative(duration, times.size());
    }

    public static String toRelative(Date start, Date end, int level){
        assert start.after(end);
        return toRelative(end.getTime() - start.getTime(), level);
    }

}
