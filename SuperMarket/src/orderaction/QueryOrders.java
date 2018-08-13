package orderaction;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import address.Address;
import address.AddressServiceImp;
import orders.OrderInfo;
import orders.ShopCart;
import user.User;

public class QueryOrders extends ActionSupport{
	List<OrderInfo> orderlist=new ArrayList<OrderInfo>();
	private Address orderaddress;
	

	public List<OrderInfo> getOrderlist() {
		return orderlist;
	}


	public void setOrderlist(List<OrderInfo> orderlist) {
		this.orderlist = orderlist;
	}


	public Address getOrderaddress() {
		return orderaddress;
	}


	public void setOrderaddress(Address orderaddress) {
		this.orderaddress = orderaddress;
	}


	public String QueryByUser() throws Exception {
			HttpSession session = ServletActionContext.getRequest().getSession();
			User user = new User(); 
			String userid="";
			OrderServiceImp imp1 = new OrderServiceImp();
			AddressServiceImp imp2 = new AddressServiceImp();
			Address address = new Address();
			List<ShopCart> shopcartlist = new ArrayList<ShopCart>();
			
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
			
	
		
		
	return "QueryByUser";}
	
	
	
}
