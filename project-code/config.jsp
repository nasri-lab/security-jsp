<%@ page import="java.sql.*" %>

<%
    final String DB_USER = "root";
    final String DB_PASS = "rootpassword";
    final String DB_URL = "jdbc:mysql://db:3306/security_lab_db";

    Connection conn = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>