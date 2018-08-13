package orderlist;
import java.util.List;
public class OrderInfo {
	
		private String ding_id;
		private List<ShopCart> shopcart_list;//shopcart类型是带数量参数的Goods子类
		private String ding_date;
		private double ding_toatls;
	    private String ding_status;
	    private String ding_userid;
	    private Integer ding_address;
		private Address ding_Address;
		public OrderInfo() {
			super();
			// TODO Auto-generated constructor stub
		}
		public OrderInfo(String ding_id, List<ShopCart> shopcart_list, String ding_date, double ding_toatls,
				String ding_status, String ding_userid, Integer ding_address, Address ding_Address2) {
			super();
			this.ding_id = ding_id;
			this.shopcart_list = shopcart_list;
			this.ding_date = ding_date;
			this.ding_toatls = ding_toatls;
			this.ding_status = ding_status;
			this.ding_userid = ding_userid;
			this.ding_address = ding_address;
			ding_Address = ding_Address2;
		}
		@Override
		public String toString() {
			return "OrderInfo [ding_id=" + ding_id + ", shopcart_list=" + shopcart_list + ", ding_date=" + ding_date
					+ ", ding_toatls=" + ding_toatls + ", ding_status=" + ding_status + ", ding_userid=" + ding_userid
					+ ", ding_address=" + ding_address + ", ding_Address=" + ding_Address + "]";
		}
		public String getDing_id() {
			return ding_id;
		}
		public void setDing_id(String ding_id) {
			this.ding_id = ding_id;
		}
		public List<ShopCart> getShopcart_list() {
			return shopcart_list;
		}
		public void setShopcart_list(List<ShopCart> shopcart_list) {
			this.shopcart_list = shopcart_list;
		}
		public String getDing_date() {
			return ding_date;
		}
		public void setDing_date(String ding_date) {
			this.ding_date = ding_date;
		}
		public double getDing_toatls() {
			return ding_toatls;
		}
		public void setDing_toatls(double ding_toatls) {
			this.ding_toatls = ding_toatls;
		}
		public String getDing_status() {
			return ding_status;
		}
		public void setDing_status(String ding_status) {
			this.ding_status = ding_status;
		}
		public String getDing_userid() {
			return ding_userid;
		}
		public void setDing_userid(String ding_userid) {
			this.ding_userid = ding_userid;
		}
		public Integer getDing_address() {
			return ding_address;
		}
		public void setDing_address(Integer ding_address) {
			this.ding_address = ding_address;
		}
		public Address getDing_Address() {
			return ding_Address;
		}
		public void setDing_Address(Address ding_Address) {
			this.ding_Address = ding_Address;
		}
	    
}
