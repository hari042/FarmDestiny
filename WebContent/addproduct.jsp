<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@ page import = "java.util.Date.*"%>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>

<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

InputStream inputStream = null;

FileInputStream fis=null;
String url="jdbc:mysql://localhost:3306/fd";
String user="root";
String password="passmysql";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection(url,user,password);

Statement st = con.createStatement();


session=request.getSession(false); 
String n=(String)session.getAttribute("name");

String fname=request.getParameter("n");
String pname=request.getParameter("pname");
String des=request.getParameter("pdes");
String cat=request.getParameter("pcat");
String weight=request.getParameter("pwght");
String exp=request.getParameter("pdate");
String place=request.getParameter("place");


String query="INSERT INTO product_details  (`pname`, `description`, `category`, `weight`, `exp_date`,`fname`) VALUES ('"+pname+"', '"+des+"', '"+cat+"', '"+weight+"', '"+exp+"','"+n+"')";
int s=st.executeUpdate(query);
if(s==1)
{
	response.sendRedirect("userhome.jsp");
	
}
else{
	
	response.sendRedirect("product.jsp");
}
%>
</body>
</html>