package action;

import goods.Fen;
import goods.GoodService;
import goods.GoodServiceImp;
import goods.Goods;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import address.Address;
import address.AddressServiceImp;

public class ToMian extends ActionSupport{
	private List<Goods> gdslist;
	private List<Fen> fen;
	
	public List<Goods> getGdslist() {
		return gdslist;
	}

	public void setGdslist(List<Goods> gdslist) {
		this.gdslist = gdslist;
	}

	public List<Fen> getFen() {
		return fen;
	}

	public void setFen(List<Fen> fen) {
		this.fen = fen;
	}

	public String listGoods() throws Exception {
		GoodService imp = new GoodServiceImp();
		HttpSession session = ServletActionContext.getRequest().getSession();
		fen = imp.selectFen();
		gdslist=imp.selectAllGoods();
		user.User u1 = new user.User();
		u1=(user.User)session.getAttribute("curruser");
		AddressServiceImp addressServiceImp = new AddressServiceImp();
		List<Address> addressList = new ArrayList<Address>();
		if(u1!=null)
		addressList=addressServiceImp.selectByUserId(u1.getId());
		session.setAttribute("addressList",addressList);//获得该用户u1所有的地址
		/*for (Goods gd : gdslist) {
			System.out.println(gd);
		}*/
		return "allgoods";
}
	
	
	
}
