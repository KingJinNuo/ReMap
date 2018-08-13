package goods;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import orders.ShopCart;
import util.MyBatisUtil;

public class GoodServiceImp implements GoodService{

	@Override
	public List<Fen> selectFen() {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		GoodDao goodDao = sqlSession.getMapper(GoodDao.class);
		List<Fen> Fenlist = new ArrayList<Fen>();
		Fenlist = goodDao.selectFen();
		sqlSession.close();
		return Fenlist;
	}

	@Override
	public Goods selectGood(String id) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		GoodDao goodDao = sqlSession.getMapper(GoodDao.class);
		Goods good = new Goods();
		good=goodDao.selectGood(id);
		sqlSession.close();
		return good;
	}
	

	@Override
	public List<Goods> selectAllGoods() {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		GoodDao goodDao = sqlSession.getMapper(GoodDao.class);
		List<Goods> gdslist = new ArrayList<Goods>();
		gdslist=goodDao.selectAllGoods();
		sqlSession.close();
		return gdslist;
	}

	@Override
	public int updateKu(String id,int num) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		GoodDao goodDao = sqlSession.getMapper(GoodDao.class);
		int q=0;
		try {
			q=goodDao.updateKu(id, num);
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			sqlSession.close();
			// TODO: handle exception
		}
		return q;
	}

}
