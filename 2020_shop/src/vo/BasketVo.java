package vo;

public class BasketVo {
	private int i_basket;
	private int i_member;
	private int i_product;
	private int qty;
	private int price;
	private String r_dt;
	
	public int getI_basket() {
		return i_basket;
	}
	public int getI_member() {
		return i_member;
	}
	public int getI_product() {
		return i_product;
	}
	public int getQty() {
		return qty;
	}
	public int getPrice() {
		return price;
	}
	public String getR_dt() {
		return r_dt;
	}
	public void setI_basket(int i_basket) {
		this.i_basket = i_basket;
	}
	public void setI_member(int i_member) {
		this.i_member = i_member;
	}
	public void setI_product(int i_product) {
		this.i_product = i_product;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setR_dt(String r_dt) {
		this.r_dt = r_dt;
	}
	
	
}
