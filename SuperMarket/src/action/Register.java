package action;

import user.User;
import user.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class Register extends ActionSupport{
	private String tel;
	private String email;
	private String password;
	
	
	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	
	public String register() throws Exception {
		User user = new User();
		UserServiceImp imp = new UserServiceImp();
		int q=0;
		if(tel==null){
			user.setPhone("**");
			user.setId(email);
			user.setEmail(email);
		}else {
			user.setEmail("**");
			user.setId(tel);
			user.setPhone(tel);
		}
		user.setNickName("**");
		user.setRelName("**");
		user.setSex("**");
		user.setBirthday("**");
		user.setPassword(password);
	    q=imp.register(user);
		if(q==1){
		return "register";
		}else{
			return "registererror";
		}
	}
}
