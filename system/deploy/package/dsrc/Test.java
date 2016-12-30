import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.justep.deploy.AppHelper;

public class Test extends com.justep.ui.impl.JProcessorImpl {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = "{}";
		String appBuilderServer = request.getParameter("appBuilderServer");
		String useProxyBuilderServer = request.getParameter("useProxyBuilderServer");

		try {
			if ("true".equals(useProxyBuilderServer)) {
				result = AppHelper.getHttp(appBuilderServer + "/app/test", true, false);
			} else {
				result = getPackCommandInfo();
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
		JSONObject res = (JSONObject) JSONObject.parse(result);
		JSONObject data = (JSONObject) res.get("data");

		if (data != null && data.get("state") == null) {// 兼容
			data.put("state", "OK");
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		OutputStream output = response.getOutputStream();
		output.write(res.toJSONString().getBytes());
		output.flush();
		output.close();
	}

	private String getPackCommandInfo() {
		JSONObject info = new JSONObject();
		info.put("version", "3.6.0");
		info.put("state", "OK");
		if (System.getProperty("os.name").toLowerCase().indexOf("mac os x") != -1) {
			info.put("platform", "ios,android");
		} else {
			info.put("platform", "android");
		}
		return info.toJSONString();
	}
}
