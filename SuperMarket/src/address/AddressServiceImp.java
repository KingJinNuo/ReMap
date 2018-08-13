package address;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;

public class AddressServiceImp implements AddressService{

	@Override
	public List<Address> selectByUserId(String id) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		AddressDao dao = sqlsession.getMapper(AddressDao.class);
		List<Address> list=new ArrayList<Address>(); 
		list=dao.selectByUserId(id);
		sqlsession.close();
		return list;
	}

	@Override
	public int AddNewAddress(Address a) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		AddressDao dao = sqlsession.getMapper(AddressDao.class);
		int q=0; 
		
		try {
			q=dao.AddNewAddress(a);
			sqlsession.commit();
		} catch (Exception e) {
			sqlsession.rollback();
			e.printStackTrace();
		}finally{
			sqlsession.close();
		}
		
		return q;
	}

	@Override
	public Address selectById(int id) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		AddressDao dao = sqlsession.getMapper(AddressDao.class);
		Address address = new Address();
		try {
			address=dao.selectById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		sqlsession.close();
		return address;
	}

	@Override
	public int deleteAddress(int id) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		AddressDao dao = sqlsession.getMapper(AddressDao.class);
		int q=0;
		try {
			q=dao.deleteAddress(id);
		sqlsession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		sqlsession.close();
		return q;
	}

}
