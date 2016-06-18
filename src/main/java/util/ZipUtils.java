package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipUtils {

	private List<String> fileList;
	private static final String OUTPUT_ZIP_FILE = "D:\\EncryptedFiles\\EncryptedFiles.zip";
	private static final String SOURCE_FOLDER = "D:\\EncryptedFiles";
	private static final List<String> INCLUDE = new ArrayList<String>();
	private static final List<String> IGNORE = new ArrayList<String>();
	
	public ZipUtils() {
		fileList = new ArrayList<String>();
	}

	public static void main(String[] args) {
		ZipUtils appZip = new ZipUtils();
		
		
		INCLUDE.add("jpg");
				INCLUDE.add("me.jpg");
				INCLUDE.add("pngg");
		INCLUDE.add("png");
				INCLUDE.add("abhiheet das.jpg");
				INCLUDE.add("abhishek dubey.jpg");
				INCLUDE.add("aman.jpg");
		INCLUDE.add("readme.txt");

/*		
  		IGNORE.add("mytemp");
		IGNORE.add("a_ignore_me.jpg");
		IGNORE.add("newprs.txt");
*/		
		appZip.generateFileList(new File(SOURCE_FOLDER), INCLUDE, IGNORE);
		appZip.zipIt(OUTPUT_ZIP_FILE);
	}

	public void generateFileList(File tree, List<String> argInclude, List<String> argIgnore) {
		List<String> curChilds = Arrays.asList(tree.getParentFile().list());
		boolean noScan = true;
		for (String include : argInclude) {
			if(curChilds.contains(include)){
				noScan = false;
				break;
			}
		}
		
		if(argInclude.contains(tree.getName()) || noScan){
			if (tree.isFile() && !fileList.contains(generateZipEntry(tree.toString()))) {
				fileList.add(generateZipEntry(tree.toString()));
			}
			if (tree.isDirectory()) {
				System.out.println("found dir............  ["+tree.getName()+"]");
				String[] branch = tree.list();
				for (String filename : branch) {
					generateFileList(new File(tree, filename), argInclude, argIgnore);
				}
			}
		}
/*		if(!argIgnore.contains(tree.getName())){
			if (tree.isFile() && !fileList.contains(generateZipEntry(tree.toString()))) {
				fileList.add(generateZipEntry(tree.toString()));
			}
			if (tree.isDirectory()) {
				System.out.println("found dir............  ["+tree.getName()+"]");
				String[] branch = tree.list();
				for (String filename : branch) {
					generateFileList(new File(tree, filename), argInclude, argIgnore);
				}
			}
		}
*/	}

	private String generateZipEntry(String file) {
		return file.substring(SOURCE_FOLDER.length() + 1, file.length());
	}
	
	
	public void zipIt(String zipFile) {
		byte[] buffer = new byte[1024];
		String source = "";
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		try {
			try {
				source = SOURCE_FOLDER.substring(SOURCE_FOLDER.lastIndexOf("\\") + 1, SOURCE_FOLDER.length());
			} catch (Exception e) {
				source = SOURCE_FOLDER;
			}
			fos = new FileOutputStream(zipFile);
			zos = new ZipOutputStream(fos);

			System.out.println("Output to Zip : " + zipFile);
			FileInputStream in = null;

			for (String file : this.fileList) {
				System.out.println("File Added : " + file);
				ZipEntry ze = new ZipEntry(source + File.separator + file);
				zos.putNextEntry(ze);
				try {
					in = new FileInputStream(SOURCE_FOLDER + File.separator + file);
					int len;
					while ((len = in.read(buffer)) > 0) {
						zos.write(buffer, 0, len);
					}
				} finally {
					in.close();
				}
			}

			zos.closeEntry();
			System.out.println("Folder successfully compressed");

		} catch (IOException ex) {
			ex.printStackTrace();
		} finally {
			try {
				zos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	
}
