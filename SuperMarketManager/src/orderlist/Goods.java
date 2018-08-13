package orderlist;

public class Goods {
	private String id;
	private String name;
	private String discription;//商品描述
	private double price;
	private String date; //生产日期
	private String qgp;//保质期
	private String type;//商品类别
	private String place;
	private String size;
	private int remain;
	private String fgds;//商品分类
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getQgp() {
		return qgp;
	}
	public void setQgp(String qgp) {
		this.qgp = qgp;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public String getFgds() {
		return fgds;
	}
	public void setFgds(String fgds) {
		this.fgds = fgds;
	}
	public Goods(String id, String name, String discription, double price, String date, String qgp, String type,
			String place, String size, int remain, String fgds) {
		super();
		this.id = id;
		this.name = name;
		this.discription = discription;
		this.price = price;
		this.date = date;
		this.qgp = qgp;
		this.type = type;
		this.place = place;
		this.size = size;
		this.remain = remain;
		this.fgds = fgds;
	}
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", name=" + name + ", discription=" + discription + ", price=" + price + ", date="
				+ date + ", qgp=" + qgp + ", type=" + type + ", place=" + place + ", size=" + size + ", remain="
				+ remain + ", fgds=" + fgds + "]";
	}
	
}
