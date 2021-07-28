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
String fname=(String)session.getAttribute("name");
System.out.println(fname);

String sql1="select dealer from purchase where pr_id ="+id;
ResultSet rs3=st.executeQuery(sql1);
if(rs3.next())
{
String dname=rs3.getString("dealer");


String sql2="UPDATE purchase  SET status = 'accepted' WHERE pr_id ="+id;
int rs1=st.executeUpdate(sql2);
if(rs1==1)
{

String query="INSERT INTO connection  (`fname`, `dname`) VALUES ('"+fname+"', '"+dname+"')";
int s=st.executeUpdate(query);
		
	response.sendRedirect("profile.jsp");
}
else
{
	response.sendRedirect("viewproducts.jsp");
	
}
}
else
{
	response.sendRedirect("viewproducts.jsp");
}

%>
</body>
</html>