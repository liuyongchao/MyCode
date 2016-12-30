import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.justep.biz.client.ActionUtils;
import com.justep.deploy.HttpClientManager;

public class XPaasInfo extends com.justep.ui.impl.JProcessorImpl {
	private static String URL_PAAS_CONSOLE = "";
	private static String paasToken = null;
	private static String paasSession = null;

	private static Map<String, String> map = System.getenv();

	static {
		Iterator<Entry<String, String>> it = map.entrySet().iterator();
		while (it.hasNext()) {
			Entry<String, String> entry = (Entry<String, String>) it.next();
			if ("console_url".equalsIgnoreCase(entry.getKey())) {
				URL_PAAS_CONSOLE = entry.getValue() + "/paas";
			}
		}
	}

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = "";
		String option = request.getParameter("option");
		String token = request.getParameter("token");
		String sessionID = request.getParameter("sessionID");
		if ("login".equalsIgnoreCase(option)) {
			paasToken = login(token);
			result = "{\"paasToken\":\"" + paasToken + "\"}";
			System.out.println(result);
		}
		if ("set".equalsIgnoreCase(option)) {
			String paasConsoleURL = request.getParameter("paasConsoleURL");
			URL_PAAS_CONSOLE = (null == paasConsoleURL || "".endsWith(paasConsoleURL)) ? URL_PAAS_CONSOLE : paasConsoleURL + "/paas";
			result = "{\"msg\":\"" + "set ok" + "\"}";
		}
		if ("setSessionID".equalsIgnoreCase(option)) {
			paasSession = checkSession(sessionID);
			result = "{\"sessionID\":\"" + (paasSession == null ? "" : paasSession) + "\"}";
		}
		if (paasToken != null || paasSession != null) {
			if ("loadProject".equals(option)) {
				result = projectInfo(request);
			} else if ("loadApp".equals(option)) {
				result = appCloudInfo(request);
			} else if ("templateInfo".equalsIgnoreCase(option)) {
				result = templateInfo();
			} else if ("state".equalsIgnoreCase(option)) {
				result = checkStat(request);
			} else if ("checkApp".equalsIgnoreCase(option)) {
				result = checkApp(request);
			}
		} else {
			if ("set".equalsIgnoreCase(option)) {
				System.out.println("console: " + URL_PAAS_CONSOLE);
			} else {
				result = "{\"msg\":\"无效登录或已过期  " + " 请重新登入\":\"option\":\"" + option + "\"}";
				System.out.println(result);
			}
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType(ActionUtils.JSON_CONTENT_TYPE);
		OutputStream output = response.getOutputStream();
		output.write(result.getBytes("UTF-8"));
		output.flush();
		output.close();
	}

	private String checkStat(HttpServletRequest request) {
		return HttpClientManager.sendGetRequest(URL_PAAS_CONSOLE + "/apps/service/state/" + request.getParameter("serviceID"));
	}

	private String templateInfo() {
		return HttpClientManager.sendGetRequest(urlGetTemplate());
	}

	private String checkApp(HttpServletRequest request) {
		try {
			String url = request.getParameter("path");
			URL serverUrl = new URL(url);
			HttpURLConnection urlcon = (HttpURLConnection) serverUrl.openConnection();
			if (urlcon.getResponseCode() == HttpURLConnection.HTTP_OK) {
				return "{\"msg\":\"文件存在 " + "\",\"success\":\"true\"}";
			} else {
				return "{\"msg\":" + "\"请重新部署\",\"success\":\"false\"}";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"msg\":\"检查失败！  " + "\",\"success\":\"false\"}";
		}
	}

	private String appCloudInfo(HttpServletRequest request) {
		String projectId = request.getParameter("projectId");
		String paasServiceID = request.getParameter("paasServiceID");
		if (projectId != null && !"".equals(projectId)) {
			return HttpClientManager.sendGetRequest(urlGetApp(projectId));
		} else {
			return HttpClientManager.sendGetRequest(urlApp(paasServiceID));
		}
	}

	private String projectInfo(HttpServletRequest request) {
		String result = "";
		String serviceID = request.getParameter("serviceID");
		if (serviceID != null && !"".equals(serviceID)) {
			result = HttpClientManager.sendGetRequest(URL_PAAS_CONSOLE + "/project/info/" + serviceID);
		} else {
			result = HttpClientManager.sendGetRequest(URL_PAAS_CONSOLE + "/projects?type=1");
		}
		return result;
	}

	private String urlApp(String id) {
		return URL_PAAS_CONSOLE + "/apps/" + id;
	}

	private String urlGetApp(String projectId) {
		return URL_PAAS_CONSOLE + "/apps?projectId=" + projectId + "&type=1";
	}

	private String urlGetTemplate() {
		return URL_PAAS_CONSOLE + "/sys/temps";
	}

	public String checkSession(String sessionId) {
		HttpClientManager.setJsessionID(sessionId);
		String result = HttpClientManager.sendGetRequest(urlGetTemplate());
		if (result.trim().startsWith("{")) {
			JSONObject jsonResult = JSON.parseObject(result);
			if (jsonResult.getBoolean("LOGIN_OUT") != null) {
				return null;
			} else {
				return sessionId;
			}
		} else {
			return null;
		}
	}

	public String login(String token) {
		JSONObject jsonParams = new JSONObject();
		jsonParams.put("token", token);
		String urlLogin = URL_PAAS_CONSOLE + "/login";
		String result = HttpClientManager.sendRequest(urlLogin, jsonParams.toJSONString());
		if (result.trim().startsWith("{")) {
			JSONObject jsonResult = JSON.parseObject(result);
			if (jsonResult.getBoolean("success")) {
				return jsonResult.getString("object");
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

}
