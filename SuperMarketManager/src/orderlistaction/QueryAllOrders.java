package orderlistaction;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import orderlist.Address;
import orderlist.OrderInfo;
import orderlist.ShopCart;
import orderlistdao.OrderServiceImp;

public class QueryAllOrders extends ActionSupport{
		private int pp;//当前页
		private int an;//allorders

	

	public int getPp() {
			return pp;
		}



		public void setPp(int pp) {
			this.pp = pp;
		}



		public int getAn() {
			return an;
		}



		public void setAn(int an) {
			this.an = an;
		}



	public String queryAll() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter pw = response.getWriter();
		List<ShopCart> shopcartlist = new ArrayList<ShopCart>();
		List<OrderInfo> orderlist=new ArrayList<OrderInfo>();
		Address address = new Address();
		OrderServiceImp imp = new OrderServiceImp();
		
		if(imp.queryAllorders(pp)!=null){
			session.setAttribute("pp",pp);
			an=imp.queryOrderNum();//查询所有订单的数量
			session.setAttribute("an",an);
		    orderlist=imp.queryAllorders(pp+(pp-1)*5);//查寻当前页的商品信息
		 for (int j=0;j<orderlist.size();j++) {//遍历该用户的账单
			 //查询该账单号下所对应的商品详情
			 shopcartlist=(ArrayList<ShopCart>) imp.queryShopCartList(orderlist.get(j).getDing_id());
			 orderlist.get(j).setShopcart_list(shopcartlist);
			 address=imp.queryAddressId(orderlist.get(j).getDing_address());
			 orderlist.get(j).setDing_Address(address);
		}
			 session.setAttribute("orderlist", orderlist);
			 pw.print("true");
		}
			 pw.close();
	return null;
	}
}
