package orders;

import goods.Goods;

public class ShopCart extends Goods{
		private int count;

		public ShopCart(int count) {
			super();
			this.count = count;
		}

		public ShopCart() {
			super();
			// TODO Auto-generated constructor stub
		}

	
		public ShopCart(String id, String name, String discription, double price, String date, String qgp, String type,
				String place, String size, int remain, String fgds) {
			super(id, name, discription, price, date, qgp, type, place, size, remain, fgds);
			// TODO Auto-generated constructor stub
		}

		public int getCount() {
			return count;
		}

		public void setCount(int count) {
			this.count = count;
		}

		@Override
		public String toString()  {
			String str=super.toString();
			return str+"ShopCart [count=" + count + "]";
		}
		

	

	
	
}
