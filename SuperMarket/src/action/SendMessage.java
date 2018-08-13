package action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import util.CreateCodeUtil;
import util.SendMessageUtil;


import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;

public class SendMessage extends ActionSupport{
			private String phone;
			public String getPhone() {
				return phone;
			}
			public void setPhone(String phone) {
				this.phone = phone;
			}
		
			public String sendmessage() throws Exception {
					String phonecode=CreateCodeUtil.CreateCode();
					HttpSession session = ServletActionContext.getRequest().getSession();
					HttpServletResponse response = ServletActionContext.getResponse();
					session.setAttribute("phonecode",phonecode);
					String jsonString=null;
					try{
						SendMessageUtil.sendmessage(phone,phonecode);
						jsonString=JSON.toJSONString(true);
					}catch(Exception e){
						jsonString=JSON.toJSONString(false);
						e.printStackTrace();
					}
					PrintWriter pw = response.getWriter();
					pw.write(jsonString);
					pw.close();
					return null;
			}
	
	
	
}
