package util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URL;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class ChatUtil {

	/**
	 * 接受问题，百知机器人会将答案通过返回值返回。<br/>
	 * 备注：此方法调用需要连接网络。
	 * @param str
	 * @return
	 */
	public static String chat(String str) {
		String url = " http://www.tuling123.com/openapi/api?key=61bf91c6c07f4579a73f499e83ff62b0&info="
				+ str;
		String result = ""; // 返回信息

		// 创建一个htt客户端
		HttpClient httpClient = new DefaultHttpClient();
		// 创建一个httpGet请求
		HttpGet getHttp = null;
		// 接受客户端发回的响应
		HttpResponse httpResponse;
		try {
			URL url1 = new URL(url);
			URI uri = new URI(url1.getProtocol(), url1.getHost(),
					url1.getPath(), url1.getQuery(), null);
			getHttp = new HttpGet(uri);
			httpResponse = httpClient.execute(getHttp);
			int statusCode = httpResponse.getStatusLine().getStatusCode();
			if (statusCode == HttpStatus.SC_OK) {
				// 得到客户段响应的实体内容
				HttpEntity responseHttpEntity = httpResponse.getEntity();
				// 得到输入流
				InputStream in = responseHttpEntity.getContent();
				// 得到输入流的内容
				String str2 = getData(in);
				JSONObject jsonObject = JSONObject.fromObject(str2);
				result = jsonObject.toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 读取返回的信息
	 * 
	 * @param in
	 * @return
	 */
	private static String getData(InputStream in) {
		String result = "";
		StringBuilder sb = new StringBuilder();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(in, "utf-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		}
		String line = "";
		try {
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (result != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return sb.toString();
	}

}
