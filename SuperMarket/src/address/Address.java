package address;

public class Address {

	private Integer ad_id;
	private String ad_name;
	private String ad_tel;
	private String ad_add;
	private String ad_userid;
	public Address(Integer ad_id, String ad_name, String ad_tel, String ad_add,
			String ad_userid) {
		super();
		this.ad_id = ad_id;
		this.ad_name = ad_name;
		this.ad_tel = ad_tel;
		this.ad_add = ad_add;
		this.ad_userid = ad_userid;
	}
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getAd_id() {
		return ad_id;
	}
	public void setAd_id(Integer ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_tel() {
		return ad_tel;
	}
	public void setAd_tel(String ad_tel) {
		this.ad_tel = ad_tel;
	}
	public String getAd_add() {
		return ad_add;
	}
	public void setAd_add(String ad_add) {
		this.ad_add = ad_add;
	}
	public String getAd_userid() {
		return ad_userid;
	}
	public void setAd_userid(String ad_userid) {
		this.ad_userid = ad_userid;
	}
	@Override
	public String toString() {
		return "Address [ad_id=" + ad_id + ", ad_name=" + ad_name + ", ad_tel="
				+ ad_tel + ", ad_add=" + ad_add + ", ad_userid=" + ad_userid
				+ "]";
	}
	
	
}
