package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminUpdateDetails
 */
@SuppressWarnings("serial")
@WebServlet("/AdminUpdateDetails")
public class AdminUpdateDetails extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("adminname");
		String mobile = request.getParameter("contactnumber");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int updateinfo = statement.executeUpdate("update tbladmin set adminName='" + name + "',mobilenumber='" + mobile+ "',email='" + email + "' where username='" + session.getAttribute("uname") + "'");
			if (updateinfo > 0) {
				String message = "Profile updated sucessfully.";
				session.setAttribute("message", message);
				response.sendRedirect("admin-profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
