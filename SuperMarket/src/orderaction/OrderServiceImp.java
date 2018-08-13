package orderaction;

import java.util.ArrayList;
import java.util.List;

import javax.jms.Session;

import org.apache.ibatis.session.SqlSession;

import orders.OrderInfo;
import orders.OrdersAndGoods;
import orders.ShopCart;
import util.MyBatisUtil;

public class OrderServiceImp implements OrderService{
//订单入库
public int createOrder(OrderInfo order){
	SqlSession sqlSession = MyBatisUtil.getSqlSession();
	OrderDao dao = sqlSession.getMapper(OrderDao.class);
	int q=0;
	try {
		q= dao.createOrder(order);
		sqlSession.commit();
	} catch (Exception e) {
		sqlSession.rollback();
		e.printStackTrace();
	}
	sqlSession.close();
	return q;
}
//查询某户的所有订单
@Override
public List<OrderInfo> selectByUser(String userid) {
	SqlSession sqlSession = MyBatisUtil.getSqlSession();
	OrderDao dao = sqlSession.getMapper(OrderDao.class);
	ArrayList<OrderInfo> list = new ArrayList<OrderInfo>();
	try {
		list=(ArrayList<OrderInfo>) dao.selectByUser(userid);
	} catch (Exception e) {
			e.printStackTrace();
	
	}
	sqlSession.close();
	return list;
}
//生成订单——商品表
@Override
public int createOrderAndGood(OrdersAndGoods org) {
	SqlSession sqlSession = MyBatisUtil.getSqlSession();
	OrderDao dao = sqlSession.getMapper(OrderDao.class);
	int q=0;
	try {
		q=dao.createOrderAndGood(org);
		sqlSession.commit();
	}catch (Exception e) {
		sqlSession.rollback();
		sqlSession.close();
	}
	sqlSession.close();
	return q;
}
//查询该订单中商品的数量
@Override
public int selectGoodsnum(String goodid) {
	SqlSession sqlSession = MyBatisUtil.getSqlSession();
	OrderDao dao = sqlSession.getMapper(OrderDao.class);
	int q=0;
	try {
		q=dao.selectGoodsnum(goodid);
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	sqlSession.close();
	return q;
}
//查询该订单内所有商品的id集合
@Override
public List<ShopCart> selectGoodsids(String goodsid) {
	SqlSession sqlSession = MyBatisUtil.getSqlSession();
	OrderDao dao = sqlSession.getMapper(OrderDao.class);
	ArrayList<ShopCart> list = new ArrayList<ShopCart>();
    try {
		list = (ArrayList<ShopCart>) dao.selectGoodsids(goodsid);
	} catch (Exception e) {
		
		e.printStackTrace();
	}
    sqlSession.close();
	return list;
}
@Override
public int updateorder(String orderid) {
	SqlSession sqlSession = MyBatisUtil.getSqlSession();
	OrderDao dao = sqlSession.getMapper(OrderDao.class);
	int q=0;
	try {
		q=dao.updateorder(orderid);
		sqlSession.commit();
	} catch (Exception e) {
	e.printStackTrace();
	sqlSession.rollback();
	}
	sqlSession.close();
	return q;
}

}
