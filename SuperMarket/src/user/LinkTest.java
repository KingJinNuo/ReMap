package user;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import util.MyBatisUtil;


public class LinkTest {

	@Test
	public void test(){
		UserServiceImp imp = new UserServiceImp();
		User user = new User();
		user.setId("1");
		user.setEmail("123@123");
		user.setPassword("123");
		user.setNickName("666");
		user.setRelName("777");
		user.setSex("ff");
		user.setBirthday("1998-8-9");
		imp.register(user);
	}
	
	
}
