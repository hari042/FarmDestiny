<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

int  id=Integer.parseInt(request.getParameter("id"));

String url="jdbc:mysql://localhost:3306/fd";
String user="root";
String password="passmysql";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection(url,user,password);
Statement st=con.createStatement();
session=request.getSession(false);  
String username=(String)session.getAttribute("name");
String s2="select * from product_details where pid="+id;
ResultSet rs=st.executeQuery(s2);
if(rs.next())
{
session=request.getSession(false); 
String n=(String)session.getAttribute("name");

String dname=request.getParameter("n");

String pname=rs.getString("pname");
String fname=rs.getString("fname");
String status="pending";
System.out.println(pname);
System.out.println(fname);
System.out.println(n);

String sql2="insert into purchase (`pname`, `dealer`, `status`,`fname`) values('"+pname+"','"+n+"','"+status+"','"+fname+"')";
int rs1=st.executeUpdate(sql2);
if(rs1==1)
{
	
	response.sendRedirect("dprofile.jsp");
}
else
{
	response.sendRedirect("viewproducts.jsp");
	
}
}
else{
	
	response.sendRedirect("viewproducts.jsp");
}
%>
</body>
</html>