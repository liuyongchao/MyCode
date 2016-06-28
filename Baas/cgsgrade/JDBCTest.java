package cgsgrade;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.junit.Test;

import com.justep.baas.data.sql.SQLException;

public class JDBCTest {
	/**
	 * 读取 blob数据: 1. 使用 getBlob方法读取到 Blob对象 2. 调用 Blob的
	 * getBinaryStream()方法得到输入流。再使用IO操作即可.
	 */
	@Test
	public static ArrayList readBlob(String PGE_UUID) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		// ArrayList list;
		ArrayList<String> list = new ArrayList();
		try {
			connection = JDBCTools.getConnection();
			String sql = "SELECT UUID,EF_FILE " + "FROM pg_efile WHERE PGE_UUID = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, PGE_UUID);
			resultSet = preparedStatement.executeQuery();
			try {
				while (resultSet.next()) {
					String EF_UUID = resultSet.getString(1);
					Blob EF_FILE = resultSet.getBlob(2);
					InputStream in = EF_FILE.getBinaryStream();
					System.out.println(in.available());
					// 判断文件夹是否存在
					// File userImg = new
					// File(Thread.currentThread().getContextClassLoader().getResource("").getPath()
					// + ".." + File.separator + ".." + File.separator +
					// "userImg");
					File userImg = new File(Thread.currentThread().getContextClassLoader().getResource("").getPath() + ".." + File.separator + ".." + File.separator + ".." + File.separator + ".."
							+ File.separator + "model" + File.separator + "UI2" + File.separator + "cgsgrade" + File.separator + "userImg");

					System.out.println("userImg:" + userImg);
					if (!userImg.exists() && !userImg.isDirectory()) {
						userImg.mkdir();
					}

					// File file = new
					// File(Thread.currentThread().getContextClassLoader().getResource("").getPath()
					// + ".." + File.separator + ".." + File.separator +
					// "userImg" + File.separator + PGE_UUID);
					File file = new File(userImg + File.separator + PGE_UUID);

					// 如果文件夹不存在则创建
					if (!file.exists() && !file.isDirectory()) {
						file.mkdir();
					}
					OutputStream out = new FileOutputStream(file + File.separator + EF_UUID + ".jpg");
					// String path = file + File.separator + EF_UUID + ".jpg";
					// String path = ".." + File.separator + ".." +
					// File.separator + ".." + File.separator + "userImg" +
					// File.separator + PGE_UUID +File.separator + EF_UUID +
					// ".jpg";
					// String path = ".." + File.separator + ".." +
					// File.separator + ".." + File.separator + "runtime"
					// +File.separator + "BaasServer" +File.separator +
					// "userImg" + File.separator + PGE_UUID +File.separator +
					// EF_UUID + ".jpg";
					// String path =
					// "D:/WeX5_V3.4/runtime/BaasServer/userImg/41ITJG873NPI7Q6SM0TM3GPW98O6IYLU/C716F16E1B00000160AB114F1D741DF6.jpg";
					// String path = "./userImg/" + PGE_UUID + "/" + EF_UUID +
					// ".jpg";
					String path = "." + "/" + "userImg" + "/" + PGE_UUID + "/" + EF_UUID + ".jpg";
					System.out.println("path=my+:" + path);
					list.add(path);
					byte[] buffer = new byte[1024];
					int len = 0;
					while ((len = in.read(buffer)) != -1) {
						out.write(buffer, 0, len);
					}

					in.close();
					out.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTools.releaseDB(resultSet, preparedStatement, connection);
		}
		return list;
	}

	/**
	 * 插入 BLOB 类型的数据必须使用 PreparedStatement：因为 BLOB 类型 的数据时无法使用字符串拼写的。
	 * 
	 * 调用 setBlob(int index, InputStream inputStream)
	 */
	@Test
	public static void testInsertBlob(String UUID, String EF_ID, String PGE_UUID, String EF_FILE, String USER_NAME, String TYPE) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = JDBCTools.getConnection();

			String sql = "INSERT INTO pg_efile(UUID,EF_ID,PGE_UUID,USER_NAME,EF_FILE,TYPE,EF_UP_USER_ID)" + "VALUES(?,?,?,?,?,?,?)";
			// System.out.println(sql);
			preparedStatement = connection.prepareStatement(sql);
			// preparedStatement.setString(1,
			// java.util.UUID.randomUUID().toString().replace("-",""));
			// preparedStatement.setString(2,
			// java.util.UUID.randomUUID().toString().replace("-",""));
			preparedStatement.setString(1, UUID);
			preparedStatement.setString(2, EF_ID);
			preparedStatement.setString(3, PGE_UUID);
			preparedStatement.setString(4, USER_NAME);
			// InputStream inputStream = new FileInputStream((String)
			// EF_FILE.get(i));
			InputStream inputStream = new FileInputStream(EF_FILE);
			preparedStatement.setBlob(5, inputStream);
			preparedStatement.setString(6, TYPE);
			preparedStatement.setString(7, USER_NAME);
			preparedStatement.executeUpdate();
			inputStream.close();
			// }

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCTools.releaseDB(null, preparedStatement, connection);
		}
	}

}
