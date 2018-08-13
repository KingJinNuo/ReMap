package orderlistdao;

import java.util.List;

import orderlist.Address;
import orderlist.OrderInfo;
import orderlist.ShopCart;

public interface OrdersDao {
	public List<OrderInfo> selectAllorders(int pp);
	public List<ShopCart> selectShopCartList(String ding_id);
	public Address selectAddressId(Integer ad_id);
	public Integer selectOrderNum();
}
