package user;

public interface UserService {
public int register(User user);
public User selectById(String id);
public User selectByIdAndPwd(String id,String password);
public int updateInfo(User user);
}
