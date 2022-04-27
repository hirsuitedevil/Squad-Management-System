<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	String pseats = request.getParameter("pseats");
	try {
		Connection connection = DatabaseConnection.getConnection();
		Statement statement = connection.createStatement();
		int updateinfo = statement.executeUpdate("update tblplayercapacity set player_cap='" + pseats + "'");
		if (updateinfo > 0) {
			response.sendRedirect("playercapacity.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>