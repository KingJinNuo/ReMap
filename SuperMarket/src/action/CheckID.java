package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import user.User;
import user.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class CheckID extends ActionSupport{
	private String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String checkid() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		User user = new User();
		UserServiceImp imp = new UserServiceImp();
		user = imp.selectById(id);
		if(user==null){
			pw.print("true");
		}else{
			pw.print("false");
		}
		
		
		return null;
	}
	
}
