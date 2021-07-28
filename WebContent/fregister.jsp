<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String fname=request.getParameter("fname");
String uname=request.getParameter("uname");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String city=request.getParameter("city");
int  pincode=Integer.parseInt(request.getParameter("pincode"));
String state=request.getParameter("state");
String country=request.getParameter("country");
String passwd=request.getParameter("password");
long mno=Long.parseLong(request.getParameter("mno"));
String address=request.getParameter("address");

try {
	String url="jdbc:mysql://localhost:3306/fd";
	String user="root";
	String password="passmysql";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= DriverManager.getConnection(url,user,password);
	Statement st = con.createStatement();

	String query="insert into Farmer values (?,?,?,?,?,?,?,?,?,?,?,?)";
	
	PreparedStatement ps=con.prepareStatement(query);
	ps.setString(1, fname);
	ps.setString(2,uname);
	ps.setString(3,email);
	ps.setLong(4,mno);
	ps.setString(5,gender);
	ps.setString(6,address);
	ps.setString(7,city);
	ps.setInt(8,pincode);
	ps.setString(9,state);
	ps.setString(10,country);
	ps.setString(11, passwd);
	ps.setString(12,"i am a farmer");
	int rs=ps.executeUpdate();	
	if(rs==1)
	{
	String type="farmer";
	String sql2="insert into profile_type (`uname`, `type`) values('"+uname+"','"+type+"')";
	int rs1=st.executeUpdate(sql2);

	
		if(rs1==1)
		{
		RequestDispatcher rd=request.getRequestDispatcher("Logins.html");
		rd.forward(request, response);
		response.sendRedirect("Logins.html");

	}
}

	
     con.close();
		
		
} catch (Exception e) {
	
		e.printStackTrace();
	}
%>
</body>
</html>