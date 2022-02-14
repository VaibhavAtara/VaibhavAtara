<%@page import="java.sql.*"%>


<%
    

Object id =  session.getAttribute("user_id");
String user_id=String.valueOf(id);
String pass="123456";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/group1?autoReconnect=true&useSSL=false","root","1234");
PreparedStatement ps =con.prepareStatement("update user set pass=? where name=?");
ps.setString(1,pass);
ps.setString(2,user_id);
ps.executeUpdate();
response.sendRedirect("Admin.jsp");










%>