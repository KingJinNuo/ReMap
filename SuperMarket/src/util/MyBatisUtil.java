package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.management.RuntimeErrorException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MyBatisUtil {
	private static SqlSessionFactory sqlSessionFactory;
    private final static ThreadLocal<SqlSession> t1= new ThreadLocal<SqlSession>();
    static{
    	
    	try {
			 InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			
			e.printStackTrace();
			throw new RuntimeException("读取失败"); 
		}
    }
    public static SqlSession openSqlSession(){
    	SqlSession sqlSession = t1.get();
    	if(sqlSession==null){
    		sqlSession = sqlSessionFactory.openSession();
    		t1.set(sqlSession);
    	}
    	return sqlSession;
    }
    public static SqlSession getSqlSession(){
    	return sqlSessionFactory.openSession();
    	
    }
    public static void closeSqlSession(){
    	SqlSession sqlSession = openSqlSession();
    	sqlSession.close();
    	t1.remove();
    	
    }
    public static void commit(){
    	SqlSession sqlSession = openSqlSession();
    	sqlSession.commit();
    	closeSqlSession();
    } 
    public static void rollback(){
    	SqlSession sqlSession = openSqlSession();
    	sqlSession.rollback();
    	closeSqlSession();
    }
    @SuppressWarnings("unchecked")
	public static Object getMapper(Class clazz){
    	return openSqlSession().getMapper(clazz);
    }
    
    
    
    
	
}
