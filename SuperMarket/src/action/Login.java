package action;

import javax.servlet.http.HttpSession;


import org.apache.struts2.ServletActionContext;

import user.User;
import user.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class Login extends ActionSupport{
	private String username;
	private String password;

public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

public String login() throws Exception {
	User user = new User();
	UserServiceImp imp = new UserServiceImp();
	int q=0;
	HttpSession session = ServletActionContext.getRequest().getSession();
	if(username!=null&password!=null){
	user = imp.selectByIdAndPwd(username, password);
	}
	if(user!=null){
		session.setAttribute("curruser", user);
		return "login";
	}else{
		return "loginerror";
	}

}
}
