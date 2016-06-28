package cgsgrade;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import com.alibaba.fastjson.JSONObject;
import com.justep.baas.action.ActionContext;
import com.justep.baas.data.sql.SQLException;
//import com.alibaba.fastjson.JSONArray;
//import com.alibaba.fastjson.JSONObject;

public class SimpleFileStore {
	// public static List path=new ArrayList();
	public static String path;

	public static JSONObject service(JSONObject params, ActionContext context) throws ServletException, IOException {

		HttpServletRequest request = (HttpServletRequest) context.get(ActionContext.REQUEST);
		HttpServletResponse response = (HttpServletResponse) context.get(ActionContext.RESPONSE);
		if (request.getMethod().equals("GET")) {
			doGet(request, response);
		} else if (request.getMethod().equals("POST")) {
			doPost(request, response);
		}
		return null;
	}

	static String docStorePath;
	static File docStoreDir;

	static {
		System.out.println();
		String baasPath = Thread.currentThread().getContextClassLoader().getResource("").getPath() + ".." + File.separator + "..";
		docStorePath = baasPath + File.separator + "model" + File.separator + "UI2" + File.separator + "cgsgrade" + File.separator + "data" + File.separator + "attachmentSimple";
		File file = new File(docStorePath);
		if (!(file.exists() && file.isDirectory())) {
			file.mkdirs();
		}
		docStoreDir = file;
		System.out.println(baasPath);
		System.out.println(docStorePath);
		System.out.println(docStoreDir);
	}

	/**
	 * get为获取文件 浏览或者下载
	 **/
	private static void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operateType = request.getParameter("operateType");
		System.out.println(operateType);
		if ("copy".equals(operateType)) {
			copyFile(request, response);
		} else {
			getFile(request, response);
		}
	}

	private static void copyFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ownerID = request.getParameter("ownerID");
		String targetOwnerID = request.getParameter("targetOwnerID");
		String storeFileName = request.getParameter("storeFileName");
		File file = new File(docStorePath + File.separator + ownerID + File.separator + storeFileName);
		File targetFile = new File(docStorePath + File.separator + targetOwnerID + File.separator + storeFileName);
		FileUtils.copyFile(file, targetFile);
	}

	private static final int BUFFER_SIZE = 32768 * 8;

	private static void getFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ownerID = request.getParameter("ownerID");
		String realFileName = URLEncoder.encode(request.getParameter("realFileName"), "utf-8");
		String storeFileName = request.getParameter("storeFileName");
		String operateType = request.getParameter("operateType");
		/* String fileSize = request.getParameter("fileSize"); */

		File file = new File(docStorePath + File.separator + ownerID + File.separator + storeFileName);
		FileInputStream fis = new FileInputStream(file);

		/* response.setContentType(mimeType); */
		/* response.setHeader("Content-Length", String.valueOf(part.getSize())); */
		response.setHeader("Cache-Control", "pre-check=0, post-check=0, max-age=0");

		String fileNameKey = "filename";
		String tempPath = docStorePath + File.separator + ownerID + File.separator;
		path = tempPath;
		// path.add(tempPath);
		System.out.println("tempPath="+tempPath);
		// System.out.println(docStorePath + File.separator + ownerID +
		// File.separator + realFileName);

		/*
		 * UserAgent ua = com.justep.ui.util.NetUtils.getUserAgent(request);
		 * if(Browser.FIREFOX.equals(ua.getBrowser().getGroup())){ fileNameKey =
		 * "filename*"; }
		 */

		if ("download".equals(operateType)) {
			// response.addHeader("Content-Disposition", "attachment; " +
			// fileNameKey + "=\"" + realFileName + "\"");
			response.addHeader("Content-Disposition", "inline; " + fileNameKey + "=\"" + realFileName + "\"");
		} else {
			response.addHeader("Content-Disposition", "inline; " + fileNameKey + "=\"" + realFileName + "\"");
		}

		OutputStream os = response.getOutputStream();
		byte[] buffer = new byte[BUFFER_SIZE];
		try {
			int read;
			while ((read = fis.read(buffer)) != -1) {
				os.write(buffer, 0, read);
			}
		} finally {
			fis.close();
		}
		// retu
	}

	/**
	 * 接受前端参数并保存文件的二进制流~
	 **/
	public static JSONObject InsertBlob(JSONObject params, ActionContext context) throws SQLException, NamingException {
		String UUID = params.getString("UUID");
		String EF_ID = params.getString("EF_ID");
		String PGE_UUID = params.getString("PGE_UUID");
		String file_name = params.getString("file_name");
		String USER_NAME = params.getString("USER_NAME");
		String TYPE = params.getString("TYPE");
		String EF_EFILE = path + file_name;
		System.out.println(EF_EFILE);
		// List EF_FILE = path;
		// for (int i = 1; i < path.size(); i++) {
		// EF_FILE=EF_FILE+","+path.get(i);
		// }
		// EF_FILE
		// path.S(',');
		JDBCTest.testInsertBlob(UUID, EF_ID, PGE_UUID, EF_EFILE, USER_NAME, TYPE);
		return null;
	}

	/**
	 * 接受前端参数并读取文件的二进制流~
	 * @throws IOException 
	 **/
	public static JSONObject readBlob(JSONObject params, ActionContext context) throws SQLException, NamingException, IOException {
		ArrayList<String> list = new ArrayList<String>();
		//String path = "";
		String PGE_UUID = params.getString("PGE_UUID");
		list = JDBCTest.readBlob(PGE_UUID);
		System.out.println(list.size());		
		for (int i = 0; i < list.size(); i++) {
			if (i == 0) {
				path ="["+"{\"id\":\"" + PGE_UUID + "\",\"fSmallImg\":\"" + list.get(i).toString() + "\",\"fBigImg\":\"" + list.get(i).toString() + "\"}";
			} else if (i == (list.size() - 1)) {
				path = path + "," + "{"+"\"id\""+""+":\"" + PGE_UUID + "\",\"fSmallImg\":\"" + list.get(i).toString() + "\",\"fBigImg\":\"" + list.get(i).toString() + "\"}"+"]";
			} else {
				path = path + "," + "{\"id\":\"" + PGE_UUID + "\",\"fSmallImg\":\"" + list.get(i).toString() + "\",\"fBigImg\":\"" + list.get(i).toString() + "\"}";
			}
		}
		//
		System.out.println("path="+path);
		String tempPath = "D:\\WeX5_V3.4\\model\\UI2\\cgsgrade\\json\\imgData.json";
		DelFile.delFile(tempPath);
		WriterFile.writerFile(tempPath, path);
		//
		System.out.println("list="+list);
		JSONObject ret = new JSONObject();
		ret.put("path",list);
		return ret;
	}

	/**
	 * post为上传
	 **/
	protected static void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String contentType = request.getContentType();
		try {
			if ("application/octet-stream".equals(contentType)) {
				storeOctStreamFile(request, response);
			} else if (contentType != null && contentType.startsWith("multipart/")) {
				storeFile(request, response);
			} else {
				throw new RuntimeException("not supported contentType");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException("storeFile异常");
		}
		response.getWriter().write("");
	}

	private static void storeOctStreamFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
		InputStream in = null;
		FileOutputStream storeStream = null;
		try {
			String ownerID = request.getParameter("ownerID");
			String storeFileName = request.getParameter("storeFileName");

			in = request.getInputStream();
			String storePath = docStorePath + File.separator + ownerID;
			getOrCreateFile(storePath);
			File toStoreFile = new File(storePath + File.separator + storeFileName);
			storeStream = new FileOutputStream(toStoreFile);
			IOUtils.copy(in, storeStream);
		} finally {
			IOUtils.closeQuietly(in);
			IOUtils.closeQuietly(storeStream);
		}
	}

	private static File getOrCreateFile(String path) {
		File storeDir = new File(path);
		if (!(storeDir.exists() && storeDir.isDirectory())) {
			storeDir.mkdirs();
		}
		return storeDir;
	}

	public static List<FileItem> parseMultipartRequest(HttpServletRequest request) throws FileUploadException {
		DiskFileItemFactory factory = new DiskFileItemFactory();

		ServletContext servletContext = request.getSession().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Parse the request
		@SuppressWarnings("unchecked")
		List<FileItem> items = upload.parseRequest(request);
		return items;
	}

	private static void storeFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, String> params = new HashMap<String, String>();
		List<FileItem> items = parseMultipartRequest(request);
		Iterator<FileItem> iter = items.iterator();
		FileItem fileItem = null;
		while (iter.hasNext()) {
			FileItem item = iter.next();
			if (item.isFormField()) {
				String name = item.getFieldName();
				String value = item.getString();
				params.put(name, value);
			} else {
				/*
				 * String fieldName = item.getFieldName(); String fileName =
				 * item.getName(); String contentType = item.getContentType();
				 * boolean isInMemory = item.isInMemory(); long sizeInBytes =
				 * item.getSize();
				 */
				fileItem = item;
			}
		}
		if (fileItem != null) {
			String storePath = docStorePath + File.separator + params.get("ownerID");
			File storeDir = new File(storePath);
			if (!(storeDir.exists() && storeDir.isDirectory())) {
				storeDir.mkdirs();
			}
			File toStoreFile = new File(storePath + File.separator + params.get("storeFileName"));
			fileItem.write(toStoreFile);
		}

	}

}
