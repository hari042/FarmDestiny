<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/home.css">
        <link rel="stylesheet" href="CSS/hom2.css">
        <link rel="stylesheet" href="CSS/home3.css">
        <link rel="stylesheet" href="CSS/footer.css">
        <link rel="stylesheet" href="CSS/profile.css">
<title>Insert title here</title>
</head>
  <body>
<%
String url="jdbc:mysql://localhost:3306/fd";
String user="root";
String password="passmysql";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection(url,user,password);
Statement st=con.createStatement();
session=request.getSession(false);  
String username=(String)session.getAttribute("name");
	
		
	String s2="select * from product_details";
	ResultSet rs1=st.executeQuery(s2);
	

%>
    <div class="header1">
       
       <img src="images/logo2.png" alt="logo" width="200" height="128"/> <h1>FarmDestiny</h1>
    </div>
    <div class="topnav">
      
        <a href="userhome.jsp" >Home</a>
        <a href="aboutus.html">About Us</a>
     <a class="button" href="Logoutserv" style="float:right">Logout</a>
    </div>
   
    
      </div>
    </div>

<div class="content1">
<h2>Available products</h2>
<table cellpadding="2" cellspacing="2" border="1" align="center">
		<tr>
			<th>pid</th>
			<th>Name</th>
			<th>Description</th>
			<th>category</th>
			<th>quantity</th>
			<th>sold by</th>
			<th>   </th>
		</tr>
		
<%
while(rs1.next())
{
	
%>
			<tr>
				<td><%=rs1.getInt("pid")%> </td>
				<td><%=rs1.getString("pname")%> </td>
				<td><%=rs1.getString("description")%> </td>
				<td><%=rs1.getString("category")%> </td>
				<td><%=rs1.getString("weight")%> </td>
				<td><%=rs1.getString("fname")%> </td>
				<td align="center">
					<a href="reqproduct.jsp?id=<%=rs1.getInt("pid")%>">intrested</a>
				</td>
			</tr>
		<%
		
}
		%>
	</table> 

</div>


 <div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 item">
                        <h3>Services</h3>
                        <ul>
                            <li><a href="#">Sell Product</a></li>
                            <li><a href="#">view product</a></li>
                            <li><a href="#">View Contact</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3>About</h3>
                        <ul>
                            <li><a href="#">Company</a></li>
                            <li><a href="#">Team</a></li>
                            <li><a href="#">Careers</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6 item text">
                        <h3>FarmDestiny</h3>
                        <p>FarmDestinyis a diversified, full-time family farm
                          that provides wholesome food and sustainably
                          produced products for our community. We are a
                          business that others can learn from, and we are a
                          family that helps our neighbors. We support other farmers who share our vision
                          of sustainable agriculture, and we work to be as selfsufficient as possible.</p>
                    </div>
                    
                <p class="copyright">FarmDestiny © 2021</p>
            </div>
        </footer>
    </div>
 
  </body>
</html>