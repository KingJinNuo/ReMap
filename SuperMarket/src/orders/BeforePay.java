package orders;
import goods.Goods;
import goods.GoodServiceImp;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import address.Address;
import address.AddressServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class BeforePay extends ActionSupport {
	private static final String User = null;
	private String buy_one;
	private int chooseNumber;
	private static double totals=0;
	private String idstring;
	
	
	public String getIdstring() {
		return idstring;
	}


	public void setIdstring(String idstring) {
		this.idstring = idstring;
	}


	public String getBuy_one() {
		return buy_one;
	}


	public void setBuy_one(String buy_one) {
		this.buy_one = buy_one;
	}


	public int getChooseNumber() {
		return chooseNumber;
	}


	public void setChooseNumber(int chooseNumber) {
		this.chooseNumber = chooseNumber;
	}


	public static double getTotals() {
		return totals;
	}


	public static void setTotals(double totals) {
		BeforePay.totals = totals;
	}

	public String buymore() throws Exception {
	String[] split = idstring.split(",");
	HttpSession session = ServletActionContext.getRequest().getSession();
	List<ShopCart> Blists =new ArrayList<ShopCart>();
	List<ShopCart> Blists1 =new ArrayList<ShopCart>();
	Blists = (List<ShopCart>)session.getAttribute("shopcart");
	if(session.getAttribute("ordercart")!=null){
		Blists1=(List<ShopCart>) session.getAttribute("ordercart");
	}
	
	if(Blists!=null){	
	for (int i=0;i<split.length;i++) {
			for (int j=0;j<Blists.size();j++) {
				if(Blists.get(j).getId().toString().equals(split[i])){
					totals+=Blists.get(j).getPrice()*Blists.get(j).getCount();
					Blists1.add(Blists.get(j));
					Blists.remove(Blists.get(j));
					continue;
				}
			}
		}
	}
	
	
	session.setAttribute("ordertotals",totals);
	session.setAttribute("ordercart",Blists1);
	session.setAttribute("shopcart", Blists);
	//session.removeAttribute("totals");
	return "buymore";
	}
	
	public String buyOne() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		GoodServiceImp goodServiceImp = new GoodServiceImp();
		List<ShopCart> Blist =new ArrayList<ShopCart>();
		ShopCart newgood=new ShopCart();
		Goods good = new Goods();
		user.User u1 = new user.User();
		u1=(user.User)session.getAttribute("curruser");
		AddressServiceImp addressServiceImp = new AddressServiceImp();
		List<Address> addressList = new ArrayList<Address>();
		if(u1!=null)
		addressList=addressServiceImp.selectByUserId(u1.getId());
		session.setAttribute("addressList",addressList);//获得该用户u1所有的地址
		if(buy_one!=null)
			good = goodServiceImp.selectGood(buy_one);
		//good类型不包含数量
		 newgood.setId(good.getId());
		 newgood.setDate(good.getDate());
		 newgood.setDiscription(good.getDiscription());
		 newgood.setFgds(good.getFgds());
		 newgood.setName(good.getName());
		 newgood.setPlace(good.getPlace());
		 newgood.setPrice(good.getPrice());
		 newgood.setQgp(good.getQgp());
		 newgood.setSize(good.getSize());
		 newgood.setType(good.getType());
		 newgood.setCount(chooseNumber);
		totals=newgood.getPrice()*newgood.getCount();
		
		Blist.add(newgood);
		session.setAttribute("ordercart",Blist);
		session.setAttribute("ordertotals",totals);
		//session.removeAttribute("totals");
	return "buyone";
	}
	
	//确定选中的地址
	public String chooseAddress() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Address address = new Address();
		List<Address> addressList = new ArrayList<Address>();
		addressList=(List<Address>) session.getAttribute("addressList");
		for (Address a : addressList) {
			if(a.getAd_id()==chooseNumber){
				address=a;
			}
		}
		session.setAttribute("usingaddress",address);
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		pw.print("true");
		pw.close();
		
		
		return null;
	}
	
	
	
	
}
