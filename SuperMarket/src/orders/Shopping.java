package orders;

import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import goods.GoodServiceImp;
import goods.Goods;

import com.opensymphony.xwork2.ActionSupport;

public class Shopping extends ActionSupport {
	private String goodid;
	private int num;
	private static double totals=0;
	
	
	public static double getTotals() {
		return totals;
	}
	public static void setTotals(double totals) {
		Shopping.totals = totals;
	}
	public String getGoodid() {
		return goodid;
	}
	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String addtocart() throws Exception {
		GoodServiceImp goodServiceImp = new GoodServiceImp();
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<ShopCart> Glist =new ArrayList<ShopCart>();
		if(session.getAttribute("shopcart")!=null){
		Glist=(ArrayList<ShopCart>)session.getAttribute("shopcart"); //购物车商品类型
		}
		Goods good = new Goods();
		if(goodid!=null)
		good=goodServiceImp.selectGood(goodid);
		int q=0;//监视购物车是否存在该商品
		if(Glist!=null){
		for (ShopCart s : Glist) {
			if(s.getId().equals(goodid)){
				s.setCount(s.getCount()+num);
				q=1;
				break;
			}
		}	
		}
		if(q==0){
		ShopCart newgood =new ShopCart();//good类型不包含数量
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
		 newgood.setCount(num);
		 Glist.add(newgood);
		}
		session.setAttribute("shopcart", Glist);
		summary();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		pw.print("true");
		pw.close();
		return null;
	}
	
	public void summary() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<ShopCart> Glist =new ArrayList<ShopCart>();
		if(session.getAttribute("shopcart")!=null){
		Glist=(ArrayList<ShopCart>)session.getAttribute("shopcart"); 
		}
		totals=0;
		for (ShopCart s : Glist) {
			totals+=s.getPrice()*s.getCount();
		}
		session.setAttribute("totals",totals);
		
	}
	public String deletefromcart() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		ArrayList<ShopCart> Glist = new ArrayList<ShopCart>();
		Glist=(ArrayList<ShopCart>) session.getAttribute("shopcart");
		for (ShopCart s : Glist) {
			if(s.getId().equals(goodid)){
				Glist.remove(s);
				break;
			}
		}	
		session.setAttribute("shopcart", Glist);
		summary();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		pw.print("true");
		pw.close();
		return null;
	}
	
	
	public String deleteAll() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		summary();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		pw.print("true");
		pw.close();
		return null;
	}
	
	
	
	public String updatecart() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		ArrayList<ShopCart> Glist = new ArrayList<ShopCart>();
		Glist=(ArrayList<ShopCart>) session.getAttribute("shopcart");
		for (ShopCart s : Glist) {
			if(s.getId().equals(goodid)){
				s.setCount(num);
				break;
			}
		}	
		session.setAttribute("shopcart", Glist);
		summary();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		pw.print("true");
		pw.close();
		return null;
	}


}
