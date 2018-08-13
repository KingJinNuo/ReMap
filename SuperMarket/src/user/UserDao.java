package user;

public interface UserDao {
public int insert(User user);
public User selectById(String id);
public User selectByIdAndPwd(String id,String password);
public int updateInfo(User user);
}
