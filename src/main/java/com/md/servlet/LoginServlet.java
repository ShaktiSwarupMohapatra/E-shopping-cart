package com.md.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.md.connection.DbCon;
import com.md.dao.UserDao;
import com.md.model.User;
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out=response.getWriter()){
//			out.print("Hello World");
			String email=request.getParameter("Login-email");
			String password=request.getParameter("Login-password");
			try {
				UserDao udao=new UserDao(DbCon.getConnection());
				User user=udao.userLogin(email, password);
				if (user != null)
				{
					request.getSession().setAttribute("author", user);
					response.sendRedirect("index.jsp");
				}
				else {
					out.print("User-Login Failed..");
				}
			}

					
		catch (Exception e) {
			e.printStackTrace();
			}
		}
	}
}
