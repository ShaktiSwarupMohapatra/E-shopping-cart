<%@ page import="com.md.model.*" %>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	User author=(User)request.getSession().getAttribute("author");
	if(author != null)
	{
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Login-Page</title>
<%@ include file="Includes/head.jsp"%>

</head>
<body>
<%@ include file="Includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="Login-email"
							placeholder="Enter Your Email" required> <label>Password</label>
						<input type="password" class="form-control" name="Login-password"
							placeholder="************" required>

					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>


		</div>
	</div>


	<%@ include file="Includes/footer.jsp"%>

</body>

</html>