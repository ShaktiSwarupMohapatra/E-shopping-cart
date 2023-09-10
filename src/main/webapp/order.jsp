<%@ page import="com.md.model.*" %>
<%@ page import="com.md.connection.*" %>
<%@ page import="com.md.dao.*" %>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User author=(User)request.getSession().getAttribute("author");
	List<Order> order = null;
	if(author != null)
	{
		request.setAttribute("person", author);
		 OrderDao orderDao  = new OrderDao(DbCon.getConnection());
			order = orderDao.userOrders(author.getId());
	}
	else{
		//response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DbCon.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		request.setAttribute("cart_list", cart_list);
	}%>
<!DOCTYPE html>
<html>
<head>
<title>My Order</title>
<%@ include file="Includes/head.jsp"%>

</head>
<body>
	<%@ include file="Includes/navbar.jsp" %>
	
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(order != null){
				for(Order o:order){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	
		
	<%@ include file="Includes/footer.jsp"%>

</body>

</html>