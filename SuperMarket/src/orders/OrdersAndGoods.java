package orders;

public class OrdersAndGoods {
	private String orderid;
	private String goodid;
	private int counts;
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getGoodid() {
		return goodid;
	}
	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public OrdersAndGoods(String orderid, String goodid, int counts) {
		super();
		this.orderid = orderid;
		this.goodid = goodid;
		this.counts = counts;
	}
	public OrdersAndGoods() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "OrdersAndGoods [orderid=" + orderid + ", goodid=" + goodid + ", counts=" + counts + "]";
	}
	
	
	
}
