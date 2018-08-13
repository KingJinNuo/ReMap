package action;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import user.User;
import user.UserServiceImp;

public class UpdateInfo extends ActionSupport{
	private String nickname;
	private String relname;
	private String sex;
	private String phone;
	private String email;
	private String passwd;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRelname() {
		return relname;
	}
	public void setRelname(String relname) {
		this.relname = relname;
	}
	public String getSexString() {
		return sex;
	}
	public void setSexString(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public String updateInfo() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		User u1 = new User();
		if(session.getAttribute("curruser")!=null){
			u1=(User) session.getAttribute("curruser");
		}
		if(nickname!=null){
			u1.setNickName(nickname);
		}
		if(relname!=null){
			u1.setRelName(relname);
		}
		if(sex!=null){
			u1.setSex(sex);
			
		}
		if(email!=null){
			u1.setEmail(email);
		}
		if(phone!=null){
			u1.setPhone(phone);
		}
		if(passwd!=null){
			u1.setPassword(passwd);
		}
		int q=0;
		UserServiceImp imp = new UserServiceImp();
		if(u1!=null){
			q=imp.updateInfo(u1);
		}
		if(q==1){
			pw.print("true");
			pw.close();
		}
		
		
		
	return null;
	}
	
	
	

}
