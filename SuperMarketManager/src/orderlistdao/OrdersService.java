package orderlistdao;

import java.util.List;

import orderlist.Address;
import orderlist.OrderInfo;
import orderlist.ShopCart;

public interface OrdersService {
	public List<OrderInfo> queryAllorders(int pp);
	public List<ShopCart> queryShopCartList(String ding_id);
	public Address queryAddressId(Integer ad_id);
	public Integer queryOrderNum();
}
