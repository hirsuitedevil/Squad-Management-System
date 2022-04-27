package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.*;
/**
 * Servlet implementation class AdminPasswordChange
 */
@SuppressWarnings("serial")
@WebServlet("/AdminPasswordChange")
public class AdminPasswordChange extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String cpassword = request.getParameter("cpassword");
		String password = request.getParameter("password");
		String confpass = request.getParameter("confpass");
		String pass = "";
		HttpSession session = request.getSession();
		try {
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery("select password from tbladmin where password='" + cpassword+ "' and username='" + session.getAttribute("uname") + "'");
			if (resultset.next()) {
				pass = resultset.getString(1);
			}
			if (password.equals(confpass)) {
				if (pass.equals(cpassword)) {
					@SuppressWarnings("unused")
					int i = statement.executeUpdate("update tbladmin set password='" + password + "' where username='"+ session.getAttribute("uname") + "' ");
					response.sendRedirect("change-password.jsp");
					statement.close();
					con.close();
				} else {	
					response.sendRedirect("change-password.jsp");
				}
			} else {
				response.sendRedirect("change-password.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
