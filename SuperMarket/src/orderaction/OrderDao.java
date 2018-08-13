package orderaction;

import java.util.List;

import goods.Goods;
import orders.OrderInfo;
import orders.OrdersAndGoods;
import orders.ShopCart;

public interface OrderDao {
public int createOrder(OrderInfo order);
public int createOrderAndGood(OrdersAndGoods org);
public List<OrderInfo> selectByUser(String userid);
public int selectGoodsnum(String goodid);
public List<ShopCart> selectGoodsids(String goodsid);
public int updateorder(String orderid);
}
