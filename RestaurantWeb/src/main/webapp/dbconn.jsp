<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
	<%
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/RestaurantWeb";
		String user = "root";
		String password = "java";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	 %>