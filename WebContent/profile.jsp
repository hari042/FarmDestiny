<%@page import="com.sun.crypto.provider.RSACipher"%>
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
</head>
<body>
<div class="header1">
       
       <img src="images/logo2.png" alt="logo" width="200" height="128"/> <h1>FarmDestiny</h1>
    </div>
    <div class="topnav">
       <a href="userhome.jsp">Home</a>
       <a href="aboutus.html">About</a>
       <a class="button" href="Logoutserv" style="float:right">Logout</a>
    </div>
<%
String url="jdbc:mysql://localhost:3306/fd";
String user="root";
String password="passmysql";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection(url,user,password);
Statement st=con.createStatement();
session=request.getSession(false);  
String username=(String)session.getAttribute("name");

String s="select * from farmer where uname='"+username+"'";
ResultSet rs=st.executeQuery(s);

if(rs.next())
{
	
	String s1="select * from purchase where fname='"+username+"' AND status='pending'";
	ResultSet rs1=st.executeQuery(s1);
	
%>

<jsp:include page="fcard.jsp" />  

      <div class="details">
      <h2>Request from Dealers</h2>
        <table>
            <tr>
              <th>Name of Dealer</th>
              <th>product</th>
              <th>Status</th>
              <th> </th>
              <th> </th>
            </tr>
            
            <tr>
            <%
            while(rs1.next())
            {
            
            
            %>
            
          	<td><%=rs1.getString("dealer")%></td>
          <td><%=rs1.getString("pname")%></td>
            <td><%=rs1.getString("status")%></td>
             <td align="center">
          	<a href="viewdcard.jsp?id=<%=rs1.getInt("pr_id")%>">view profile</a>
          	</td>
     <td align="center">
					<a href="cproduct.jsp?id=<%=rs1.getInt("pr_id")%>">Intrested</a>
				</td>
       </tr>
        
          <%
          
            }
          %>
  </table>
      </div>
      <%
      
}

String sql1="select * from  connection where fname='"+username+"'";
ResultSet rs5=st.executeQuery(sql1);

      %>

      <div class="details">
       <h2>Connection Maintained</h2>
        <table>
            <tr>
              <th>Dealername</th>
              <th> </th>
            </tr>
            <%
            while(rs5.next())
            {
            	
            %>
            <tr>
            <td><%=rs5.getString("dname") %></td>
        <td align="center">
					<a href="report.jsp?id=<%=rs5.getInt("cid")%>">Give  feedback</a>
				</td>
				
				
            </tr>
            
            <%
            }
            %>
          </table>
          
 <%
 String s3="select * from product_details where fname='"+username+"'";
 ResultSet rs3=st.executeQuery(s3);

 %>
        <div class="details">
       <h2>Product added</h2>
        <table>
            <tr>
              <th>Product Name</th>
              <th>Category</th>
              <th>Quantity</th>
            </tr>
            <%
            
       
            while(rs3.next())
            {
            
            
            %>
            
          	<td><%=rs3.getString("pname")%></td>
          <td><%=rs3.getString("category")%></td>
            <td><%=rs3.getString("weight")%></td>

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