import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.justep.ui.JustepConfig;
import com.justep.useragent.Browser;
import com.justep.useragent.UserAgent;
import com.justep.biz.client.ActionUtils;
import com.justep.deploy.HttpClientManager;

public class Export extends com.justep.ui.impl.JProcessorImpl {
	private static final String justepHome = JustepConfig.getHome();
	private static final String modelPath = com.justep.filesystem.FileSystemWrapper.instance().getRealPath("/");

	public void execute(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {

		String path = request.getParameter("filePath");
		path = path.startsWith("/") ? path.substring(1) : path;
		String sessionId = request.getParameter("sessionId");
		String consolePath = request.getParameter("paasURL");
		if (!checkSessionId(consolePath, sessionId)) {
			return;
		}
		File file = new File(modelPath + path);
		if (file.exists()) {
			File tmp = new File(justepHome + "/tmp");
			if (!tmp.exists()) {
				tmp.mkdirs();
			}
			if (file.isFile()) {
				String fileName = path.substring(path.lastIndexOf("/"), path.contains(".") ? path.lastIndexOf(".") : path.length());
				String distName = tmp.getAbsolutePath() + fileName + ".zip";
				AntZip zip = new AntZip(distName);
				String include = path.substring(0, path.lastIndexOf(".")) + ".*";
				File zipFile = zip.compress(modelPath, include);
				if (zipFile.exists()) {
					downloadFile(request, response, zipFile.getAbsolutePath(), zipFile.getName());
				}
			} else {
				String fileName = path.substring(path.lastIndexOf("/") == -1 ? 0 : path.lastIndexOf("/"));
				AntZip zip = new AntZip(tmp.getAbsolutePath() + fileName + ".zip");
				String include = path + "/";
				String[] exclude = getExclude(path);
				File zipFile = zip.compress(modelPath, include, exclude);
				if (zipFile.exists()) {
					downloadFile(request, response, zipFile.getAbsolutePath(), zipFile.getName());
				}
			}
		} else {
			System.out.println("Path:File ERROR:" + modelPath + path);
		}
	}

	private String[] getExclude(String dirPath) {
		if (dirPath.contains("UI2/")) {
			return new String[] { dirPath + "/**.release/", dirPath + "/**.cache/" };
		} else if (dirPath.contains("Native/")) {
			return new String[] { dirPath + "/build/", dirPath + "/dist/" };
		}
		return new String[] {};
	}

	private void downloadFile(HttpServletRequest request, HttpServletResponse response, String zipPath, String zipName) throws IOException {
		String fileNameKey = "filename";
		UserAgent ua = com.justep.ui.util.NetUtils.getUserAgent(request);
		if (Browser.FIREFOX.equals(ua.getBrowser().getGroup())) {
			fileNameKey = "filename*";
		}

		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.BINARY_CONTENT_TYPE);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Content-Type", ActionUtils.BINARY_CONTENT_TYPE);
		response.setHeader("Content-disposition", "attachment;" + fileNameKey + "=\"" + URLEncoder.encode(zipName, "UTF-8") + "\"");
		response.setHeader("Cache-Control", "pre-check=0, post-check=0, max-age=0");

		try {
			FileInputStream inputStream = new FileInputStream(zipPath);
			OutputStream out = response.getOutputStream();
			try {
				byte[] bt = new byte[1024];
				int i = -1;
				while ((i = inputStream.read(bt)) != -1) {
					out.write(bt, 0, i);
				}
				out.flush();

			} finally {
				out.close();
				inputStream.close();
			}
		} catch (Exception E) {
			E.printStackTrace();
		}
		File zip = new File(zipPath);
		if (zip.exists()) {
			zip.delete();
		}

	}

	private boolean checkSessionId(String consolePath, String sessionId) {
		if (consolePath == null || "".endsWith(consolePath) || sessionId == null || "".endsWith(sessionId)) {
			return false;
		}
		HttpClientManager.setJsessionID(sessionId);
		String result = HttpClientManager.sendGetRequest(consolePath + "/paas/sys/temps");
		if (result.trim().startsWith("{")) {
			JSONObject jsonResult = JSON.parseObject(result);
			if (jsonResult.getBoolean("LOGIN_OUT") != null) {
				return false;
			} else {
				return true;
			}
		} else {
			return false;
		}
	}

}
