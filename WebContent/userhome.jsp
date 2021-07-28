<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmdestiny</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/home.css">
        <link rel="stylesheet" href="CSS/hom2.css">
        <link rel="stylesheet" href="CSS/home3.css">
        <link rel="stylesheet" href="CSS/footer.css">
        <link rel="stylesheet" href="CSS/productslider.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,700&subset=latin-ext" rel="stylesheet">
<script src="script/slider.js"></script> 
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
String query2="select * from profile_type where uname='"+username+"'";
ResultSet rs=st.executeQuery(query2);
if(rs.next())
{
	String type=rs.getString("type");
	
%>
<div class="header1">
       
       <img src="images/logo2.png" alt="logo" width="200" height="128"/> <h1>FarmDestiny</h1>
    </div>
    <div class="topnav">
      
       <a href="userhome.jsp" >Home</a>
       <a href="aboutus.html">About Us</a>
       <a class="button" href="Logoutserv" style="float:right">Logout</a>


</div>


    <div id="hero-image">
      <div class="wrapper">
          <h2><strong>WELCOME TO FarmDestiny</strong><br/>
          <%= "Welcome "+username %> </h2>
          <% 
          if("farmer".equals(type))
          {%>
          <a href="product.jsp" class="button-1">Add Product</a>
          <% 
          }
          else{%>
        	  <a href="viewproducts.jsp" class="button-1">View Product</a>
        	  <% 
          }
          %>
      </div>
  </div>
 
  <div id="primary-content">
    <div class="wrapper">
      <article>
        <h3>View Profile</h3>
        <p>click here</p>
           
 <% 
          if("farmer".equals(type))
          {%>
          <a href="profile.jsp" class="button-1">Profile</a>
        
         <% 
          }
         else{%>
        	  <a href="dprofile.jsp" class="button-1">Profile</a>
          
          <%  }%>
    </article>
    </div>
</div>


  </div>
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
                          family that helps our neighbors.We support other farmers who share our vision
                          of sustainable agriculture, and we work to be as selfsufficient as possible.</p>
                    </div>
                    
                <p class="copyright">FarmDestiny © 2021</p>
            </div>
        </footer>
    </div>
<%
}
else
{
	response.sendRedirect("Logins.html");
	
	
}

%>
</body>
</html>