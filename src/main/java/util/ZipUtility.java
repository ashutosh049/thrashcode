package util;

import java.util.*;
import java.util.zip.*;
import java.io.*;

public class ZipUtility {

	public static void main(String[] args) throws IOException {
		String zipName = "jpg";
		String toBeZipped = "D:/EncryptedFiles/jpg";
//		compressImgFile(zipName, toBeZipped);
		
		File directoryToZip = new File("D:/EncryptedFiles");

		List<File> fileList = new ArrayList<File>();
		System.out.println("---Getting references to all files in: " + directoryToZip.getCanonicalPath());
		fileList = getAllFiles(directoryToZip, fileList);
		System.out.println("---Creating zip file");
		writeZipFile(directoryToZip, fileList);
		System.out.println("---Done");
		
	}

	public static String compressImgFile(String argImgName, String argImgeUrl) throws IOException {
		byte[] buffer = new byte[1024];
		FileOutputStream fos = new FileOutputStream(argImgeUrl + ".zip");
		ZipOutputStream zos = new ZipOutputStream(fos);
		ZipEntry ze = new ZipEntry(argImgName);
		zos.putNextEntry(ze);
		FileInputStream in = new FileInputStream(argImgeUrl + File.separator + argImgName);
		int len;
		while ((len = in.read(buffer)) > 0) {
			zos.write(buffer, 0, len);
		}
		in.close();
		zos.closeEntry();
		zos.close();
		return argImgeUrl + File.separator + argImgName;
	}

	public static List<File> getAllFiles(File dir, List<File> fileList) {
		try {
			File[] files = dir.listFiles();
			for (File file : files) {
				fileList.add(file);
				if (file.isDirectory()) {
					System.out.println(file.getCanonicalPath()+"------------------->directory");
					getAllFiles(file, fileList);
				} else {
					System.out.println(file.getCanonicalPath());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return fileList;
	}

	public static void writeZipFile(File directoryToZip, List<File> fileList) {

		try {
			FileOutputStream fos = new FileOutputStream(directoryToZip.getName() + ".zip");
			ZipOutputStream zos = new ZipOutputStream(fos);

			for (File file : fileList) {
				// we only zip files, not directories
//				if (!file.isDirectory()) { 
					addToZip(directoryToZip, file, zos);
//				}
			}

			zos.close();
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void addToZip(File directoryToZip, File file, ZipOutputStream zos)
			throws FileNotFoundException, IOException {

		FileInputStream fis = new FileInputStream(file);

		// we want the zipEntry's path to be a relative path that is relative
		// to the directory being zipped, so chop off the rest of the path
		String zipFilePath = file.getCanonicalPath().substring(directoryToZip.getCanonicalPath().length() + 1,
				file.getCanonicalPath().length());
		System.out.println("Writing '" + zipFilePath + "' to zip file");
		ZipEntry zipEntry = new ZipEntry(zipFilePath);
		zos.putNextEntry(zipEntry);

		byte[] bytes = new byte[1024];
		int length;
		while ((length = fis.read(bytes)) >= 0) {
			zos.write(bytes, 0, length);
		}

		zos.closeEntry();
		fis.close();
	}

}
