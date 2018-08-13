package action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class CancelOrder extends ActionSupport{
	@Override
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("ordertotals");
		session.removeAttribute("ordercart");
		session.removeAttribute("usingaddress");
		
		return "allgoods";
	}
	
	
}
