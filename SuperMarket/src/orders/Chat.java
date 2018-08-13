package orders;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import util.ChatUtil;

import com.opensymphony.xwork2.ActionSupport;

public class Chat extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String contentName;
	
	public String getContentName() {
		return contentName;
	}

	public void setContentName(String contentName) {
		this.contentName = contentName;
	}


	public String chat() throws Exception {
		String chatcontent=ChatUtil.chat(contentName);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(chatcontent);
	return null;
	}
	
	
}
