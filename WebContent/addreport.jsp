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

String url="jdbc:mysql://localhost:3306/fd";
String user="root";
String password="passmysql";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection(url,user,password);

Statement st = con.createStatement();


session=request.getSession(false); 
String n=(String)session.getAttribute("name");

String fname=request.getParameter("n");
String name=request.getParameter("name");
String grade=request.getParameter("grade");
String opn=request.getParameter("opn");



String query="INSERT INTO report  (`client`, `customer`, `opinion`, `feedback`) VALUES ('"+n+"', '"+name+"', '"+grade+"', '"+opn+"')";
int s=st.executeUpdate(query);
if(s==1)
{
	response.sendRedirect("userhome.jsp");
	
}
else{
	
	response.sendRedirect("profile.jsp");
}
%>
</body>
</html>