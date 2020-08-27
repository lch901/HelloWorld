package vo;

public class ProductVO {
	private int p_num;//테이블 번호
	private String nm;
	private int price;
	private String pic;//이미지 링크주소
	private int qty;//상품 개수
	private String info;//상품정보
	private int yn_sale;//상품(보이기/숨기기)
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
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
	public int getYn_sale() {
		return yn_sale;
	}
	public void setYn_sale(int yn_sale) {
		this.yn_sale = yn_sale;
	}
	
	
}
