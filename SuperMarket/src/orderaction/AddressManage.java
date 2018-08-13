package orderaction;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import user.User;
import address.Address;
import address.AddressServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class AddressManage extends ActionSupport {
	private String user_phone;
	private String user_name;
	private String user_address;
	private Integer address_id;

	public Integer getAddress_id() {
		return address_id;
	}
	public void setAddress_id(Integer address_id) {
		this.address_id = address_id;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String newAddress() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpSession session = ServletActionContext.getRequest().getSession();
		User u1=new User();
		List<Address> addlist = new ArrayList<Address>();
		u1 = (User) session.getAttribute("curruser");
		if(u1==null){
			return "login";
		}
		Address ad = new Address();
		int rd = new Random().nextInt(100);
		ad.setAd_id(rd);
		ad.setAd_name(user_name);
		ad.setAd_tel(user_phone);
		ad.setAd_add(user_address);
		ad.setAd_userid(u1.getId());
		AddressServiceImp addressServiceImp = new AddressServiceImp();
		if(ad.getAd_name()==null||ad.getAd_tel()==null||ad.getAd_add()==null){
			pw.print("false");
		}
		if(ad!=null)
		addressServiceImp.AddNewAddress(ad);
		if(u1!=null)
			addlist=addressServiceImp.selectByUserId(u1.getId());
			session.setAttribute("addressList", addlist);
		pw.print("true");
		pw.close();
		return null;
	}
	public String deleteAddress() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		HttpSession session = ServletActionContext.getRequest().getSession();
		AddressServiceImp imp = new AddressServiceImp();
		List<Address> addlist = new ArrayList<Address>();
		User u = new User();
		if(session.getAttribute("curruser")!=null)
			u=(User) session.getAttribute("curruser");
		int q=0;
		if(address_id!=null)
		q=imp.deleteAddress(address_id);
		if(u!=null)
		addlist=imp.selectByUserId(u.getId());
		session.setAttribute("addressList", addlist);
		if(q==1){
			pw.print("true");
			pw.close();
		}
		return null;
	}
	

}
