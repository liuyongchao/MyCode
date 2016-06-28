package cgsgrade;

import java.io.File;

import org.junit.Test;

public class DelFile {

	@Test
	public static boolean delFile(String sPath) {
		Boolean flag = false;
		File file = new File(sPath);
		// 路径为文件且不为空则进行删除
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
		}
		return flag;
	}
}
