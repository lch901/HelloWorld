package db;

public class ProductVO {
	//product
	private int i_product;
	private String nm;
	private int price;
	private String pic;
	private int qty;
	private String info;
	
	//product_import
	private int i_pi;
	private int i_date;
	
	public int getI_product() {
		return i_product;
	}
	public void setI_product(int i_product) {
		this.i_product = i_product;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getI_pi() {
		return i_pi;
	}
	public void setI_pi(int i_pi) {
		this.i_pi = i_pi;
	}
	public int getI_date() {
		return i_date;
	}
	public void setI_date(int i_date) {
		this.i_date = i_date;
	}
	
	
	
	
}
