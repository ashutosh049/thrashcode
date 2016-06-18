package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class ZipUtils2 {

	private List<String> fileList;
	private static final String OUTPUT_ZIP_FILE = "D:\\EncryptedFiles\\EncryptedFiles.zip";
	private static final String SOURCE_FOLDER = "D:\\EncryptedFiles";
	private static final List<String> IGNORE = new ArrayList<String>();

	public ZipUtils2() {
		fileList = new ArrayList<String>();
	}

	public static void main(String[] args) {
		ZipUtils2 appZip = new ZipUtils2();

		/*
		 * IGNORE.add("mytemp"); IGNORE.add("pngg");
		 * IGNORE.add("a_ignore_me.jpg"); IGNORE.add("newprs.txt");
		 */
		appZip.generateFileList(new File(SOURCE_FOLDER), IGNORE);
		appZip.zipIt(OUTPUT_ZIP_FILE);
	}

	public void generateFileList(File tree, List<String> argIgnore) {
		if (!argIgnore.contains(tree.getName())) {
			if (tree.isFile() && !fileList.contains(generateZipEntry(tree.toString()))) {
				fileList.add(generateZipEntry(tree.toString()));
			}
			if (tree.isDirectory()) {
				String[] branch = tree.list();
				for (String filename : branch) {
					generateFileList(new File(tree, filename), argIgnore);
				}
			}
		}
	}

	private String generateZipEntry(String file) {
		return file.substring(SOURCE_FOLDER.length() + 1, file.length());
	}

	public void zipIt(String zipFile) {
		byte[] buffer = new byte[1024];
		String source = "";
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		try {
			source = SOURCE_FOLDER.substring(SOURCE_FOLDER.lastIndexOf("\\") + 1, SOURCE_FOLDER.length());
			fos = new FileOutputStream(zipFile);
			zos = new ZipOutputStream(fos);

			FileInputStream in = null;

			for (String file : this.fileList) {
				System.out.println("File Added : " + file);
				ZipEntry ze = new ZipEntry(source + File.separator + file);
				zos.putNextEntry(ze);
				in = new FileInputStream(SOURCE_FOLDER + File.separator + file);
				int len;
				while ((len = in.read(buffer)) > 0) {
					zos.write(buffer, 0, len);
				}
			}
			zos.closeEntry();
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
