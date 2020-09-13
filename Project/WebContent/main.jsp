<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,db.*" %>
<%@ page import="java.io.*" %>
<% 
	ProductDAO dao=ProductDAO.getInstance();
	List<ProductVO> list=dao.mainList();

	InputStream is = request.getInputStream();
	BufferedReader br = new BufferedReader(new InputStreamReader(is));
	String str=null;
	while((str = br.readLine()) != null){
		out.print(str);
	}
%>
<div class="main">
	<div class="top">
		<div class="banner">
			<div class="banner-img"><img src="./images/banner.png"/></div>
		</div>
		<h2>인기상품</h2>
		<div class="product">
			<div class="product-1"><img src="./images/pants.png"/></div>
			<div class="product-2"><img src="./images/bag.png"/></div>
			<div class="product-3"><img src="./images/t-shirt.png"/></div>
		</div>
	</div>
	<div class="bottom">
			<%if(list!=null){ %>
				<%for(ProductVO vo : list){ %>
					<table>
						<tr><td><a href=""><img src="images/<%=vo.getPic() %>" alt="이미지"></a></td></tr>
						<tr><td><%=vo.getPrice() %></td></tr>
						<tr><td><%=vo.getNm() %></td></tr>
					</table>
				<%} %>
			<%} %>
	</div>
</div>