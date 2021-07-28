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
try{
	
String url="jdbc:mysql://localhost:3306/fd";
String user="root";
String password="passmysql";
String uname=request.getParameter("uname");
String pas=request.getParameter("pass");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection(url,user,password);
Statement st=con.createStatement();



String s1="select * from farmer where uname='"+uname+"' and password='"+pas+"'";
ResultSet rs=st.executeQuery(s1);
if(!rs.next())
{

out.println("Sorry, username or password error!");
RequestDispatcher rd=request.getRequestDispatcher("Logins.html");
rd.forward(request, response);

}
else
{

session=request.getSession();
session.setAttribute("name",uname);
response.sendRedirect("userhome.jsp");

}
}catch(Exception e)
{
out.println(e.getMessage());
}
%>


</body>
</html>