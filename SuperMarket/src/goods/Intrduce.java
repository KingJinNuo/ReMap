package goods;

import com.opensymphony.xwork2.ActionSupport;

public class Intrduce extends ActionSupport{
	private String goodsId;
	private Goods goodDetails;
	
	

	public Goods getGoodDetails() {
		return goodDetails;
	}

	public void setGoodDetails(Goods goodDetails) {
		this.goodDetails = goodDetails;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	
	@Override
	public String execute() throws Exception {
			GoodService imp = new GoodServiceImp();
			 goodDetails = imp.selectGood(goodsId);
			System.out.println(goodDetails);
		return "introduction";
	}
	
	
	
}
