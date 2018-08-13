package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import user.User;
import user.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class CheckMessageCode extends ActionSupport{
	private String messagecode;

	public String getMessagecode() {
		return messagecode;
	}

	public void setMessagecode(String messagecode) {
		this.messagecode = messagecode;
	}
	public String checkmessagecode(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw=null;
		try {
			 pw = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		String MCode = (String)session.getAttribute("phonecode");
		if(messagecode.equals("MCode")){
			pw.print("true");
		}else{
			pw.print("false");
		}
		return null;
	}
	
}
