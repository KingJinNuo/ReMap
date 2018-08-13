package orderaction;

import static org.hamcrest.CoreMatchers.nullValue;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import orders.OrderInfo;
import orders.OrdersAndGoods;
import orders.ShopCart;

import org.apache.struts2.ServletActionContext;

import address.Address;
import goods.GoodServiceImp;
import goods.Goods;

import com.opensymphony.xwork2.ActionSupport;

public class CreateOrder extends ActionSupport{
	public String createOrder() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		OrderInfo orderInfo = new OrderInfo();
		//订单三大特性
		List<ShopCart> Blists =new ArrayList<ShopCart>();
		Address address = new Address();
		user.User u1 = new user.User();
		if(session.getAttribute("ordercart")!=null)
		Blists = (List<ShopCart>)session.getAttribute("ordercart");
		if(session.getAttribute("curruser")!=null)
		u1=(user.User)session.getAttribute("curruser");
		if(session.getAttribute("usingaddress")!=null)
		address=(Address) session.getAttribute("usingaddress");
		Double t1=0.0;
		if(session.getAttribute("ordertotals")!=null){
		
			t1=(Double) session.getAttribute("ordertotals");
			if(t1<30)t1+=5;
			session.setAttribute("ordertotals",t1);
		}
		//生成16为订单号
		String orderid="";
		for(int i=0;i<16;i++){
		
			int k=new Random().nextInt(9);
			orderid+=k;
		}
		//获得订单生成时间
		Date ud = new Date();
		String d1=new SimpleDateFormat("yyy-MM-dd HH:mm:ss").format(ud.getTime());
		System.out.println(d1);
		//生成订单
		orderInfo.setDing_id(orderid);
		orderInfo.setDing_status("正在进行");
		orderInfo.setDing_toatls(t1);
		orderInfo.setDing_date(d1);
		orderInfo.setDing_userid(u1.getId());
		orderInfo.setDing_address(address.getAd_id());
		//订单入库
		OrderServiceImp imp = new OrderServiceImp();
		if(orderInfo!=null){
			imp.createOrder(orderInfo);
			
			session.removeAttribute("ordercart");
			
		}
		
		//生成订单-商品表
		OrdersAndGoods ordersAndGoods = new OrdersAndGoods();
		OrderServiceImp imp2 = new OrderServiceImp();
		OrderServiceImp imp3 = new OrderServiceImp();
		GoodServiceImp imp4 = new GoodServiceImp();
		Goods g = new Goods();
		for (ShopCart shopCart : Blists) {
			ordersAndGoods.setOrderid(orderid);
			ordersAndGoods.setGoodid(shopCart.getId());
			ordersAndGoods.setCounts(shopCart.getCount());
			System.out.println(ordersAndGoods);
			if(ordersAndGoods!=null)
				imp2.createOrderAndGood(ordersAndGoods);
			//更新库存
			 g=imp4.selectGood(shopCart.getId());
			imp4.updateKu(g.getId(),g.getRemain()-shopCart.getCount());
			
		}
	
		
		
	    return "createorder";
	}
	
	
	
	
}
