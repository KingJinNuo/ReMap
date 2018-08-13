package orderlist;

public class User {

	private String id;
	private String phone;
	private String email;
	private String password;
	private String nickName;
	private String relName;
	private String  sex;
	private String birthday;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRelName() {
		return relName;
	}
	public void setRelName(String relName) {
		this.relName = relName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public User(String id, String phone, String email, String password,
			String nickName, String relName, String sex, String birthday) {
		super();
		this.id = id;
		this.phone = phone;
		this.email = email;
		this.password = password;
		this.nickName = nickName;
		this.relName = relName;
		this.sex = sex;
		this.birthday = birthday;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", phone=" + phone + ", email=" + email
				+ ", password=" + password + ", nickName=" + nickName
				+ ", relName=" + relName + ", sex=" + sex + ", birthday="
				+ birthday + "]";
	}
	
	
}
