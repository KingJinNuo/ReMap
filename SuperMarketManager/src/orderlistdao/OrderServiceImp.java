package orderlistdao;

import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.session.SqlSession;

import orderlist.Address;
import orderlist.OrderInfo;
import orderlist.ShopCart;
import util.MyBatisUtil;

public class OrderServiceImp implements OrdersService {
	public List<OrderInfo> queryAllorders(int pp){
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		OrdersDao dao = sqlSession.getMapper(OrdersDao.class);
		List<OrderInfo> list = new ArrayList<OrderInfo>();
		try {
			list= dao.selectAllorders(pp);
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		sqlSession.close();
		return list;

	
	}

	@Override
	public List<ShopCart> queryShopCartList(String ding_id) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		OrdersDao dao = sqlSession.getMapper(OrdersDao.class);
		List<ShopCart> list = new ArrayList<ShopCart>();
		try {
			list=dao.selectShopCartList(ding_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		sqlSession.close();
		return list;
	}

	@Override
	public Address queryAddressId(Integer ad_id) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		OrdersDao dao = sqlSession.getMapper(OrdersDao.class);
		Address add = new Address();
		try {
			add=dao.selectAddressId(ad_id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		sqlSession.close();
		return add;
	}

	@Override
	public Integer queryOrderNum() {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		OrdersDao dao = sqlSession.getMapper(OrdersDao.class);
		int q=0;
		try {
			q=dao.selectOrderNum();
		} catch (Exception e) {
			// TODO: handle exception
		}
		sqlSession.close();
	return q;
	
	}

}
