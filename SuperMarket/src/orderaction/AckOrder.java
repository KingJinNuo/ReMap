package orderaction;



import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import address.Address;
import address.AddressServiceImp;
import orders.OrderInfo;
import orders.ShopCart;
import user.User;

public class AckOrder extends ActionSupport {
	private String orderid;
	
	
	public String getOrderid() {
		return orderid;
	}


	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}


	@Override
	public String execute() throws Exception {
		OrderServiceImp imp = new OrderServiceImp();
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<OrderInfo> orderlist=new ArrayList<OrderInfo>();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		User  user = new User();
		String userid="";
		OrderServiceImp imp1 = new OrderServiceImp();
		AddressServiceImp imp2 = new AddressServiceImp();
		Address address = new Address();
		List<ShopCart> shopcartlist = new ArrayList<ShopCart>();
		
		int q=0;
		if(orderid!=null){
			q=imp.updateorder(orderid);
			if(session.getAttribute("curruser")!=null){
				user=(User) session.getAttribute("curruser");
				userid=user.getId();
				if(imp1.selectByUser(userid)!=null)
				 orderlist = imp1.selectByUser(userid);//根据用户查询所有订单
				 for (int j=0;j<orderlist.size()&&j<10;j++) {//遍历该用户的账单
					 //查询该账单号下所对应的商品详情
					 shopcartlist=(ArrayList<ShopCart>) imp1.selectGoodsids(orderlist.get(j).getDing_id());
					 orderlist.get(j).setShopcart_list(shopcartlist);
					 address=imp2.selectById(orderlist.get(j).getDing_address());
					 orderlist.get(j).setDing_Address(address);
				}
				
			}
			if(orderlist!=null){
				session.setAttribute("orderlist", orderlist);
			}
	
		}
		if(q==1){
			pw.print("true");
		}else{
			pw.print("false");
		}
		pw.close();
		return null;
	}
	
}
