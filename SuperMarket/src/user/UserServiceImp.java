package user;

import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;

public class UserServiceImp implements UserService {

	@Override
	public int register(User user) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		int q =0;
		try {
			q= userDao.insert(user);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sqlSession.rollback();
		}finally{
			sqlSession.close();
		}
		
		return q;
	}

	@Override
	public User selectById(String id) {
		
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		UserDao userDao = sqlSession.getMapper(UserDao.class);
	    User user = new User();
		try {
			user=userDao.selectById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return user;
	}

	@Override
	public User selectByIdAndPwd(String id, String password) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		UserDao userDao = sqlSession.getMapper(UserDao.class);
	    User user = new User();
		try {
			user=userDao.selectByIdAndPwd(id, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		return user;
		
	}

	@Override
	public int updateInfo(User user) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		UserDao userDao = sqlSession.getMapper(UserDao.class);
		int q=0;
		try {
			q=userDao.updateInfo(user);
			sqlSession.commit();
		} catch (Exception e) {

		e.printStackTrace();
		
		}
		sqlSession.close();
		return q;
	}
	
	
}
