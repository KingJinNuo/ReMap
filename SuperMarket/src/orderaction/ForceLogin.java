package orderaction;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import user.User;

import com.opensymphony.xwork2.ActionSupport;

public class ForceLogin extends ActionSupport{
	public String forceLogin() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(session.getAttribute("curruser")==null){
			pw.print("false");
		}else{
			pw.print("true");
		}
		pw.close();
	
	return null;
	}
	
	
	
	
}
