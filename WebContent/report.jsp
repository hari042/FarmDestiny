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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/home.css">
        <link rel="stylesheet" href="CSS/hom2.css">
        <link rel="stylesheet" href="CSS/home3.css">
        <link rel="stylesheet" href="CSS/feedback.css">
        <link rel="stylesheet" href="CSS/rating.css">
        <link rel="stylesheet" href="CSS/footer.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
      <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
</head>
<body>
<div class="header1">
    <img src="images/logo2.png" alt="logo" width="200" height="128"/> <h1>FarmDestiny</h1>
    </div>
    <div class="topnav">
        <a href="userhome.jsp" >Home</a>
        <a href="#">About Us</a>
        <a class="button" href="Logins.html" style="float:right">Logout</a>
    
    </div>
  

<%
int  id=Integer.parseInt(request.getParameter("id"));

String url="jdbc:mysql://localhost:3306/fd";
String user="root";
String password="passmysql";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection(url,user,password);
Statement st=con.createStatement();

session=request.getSession(false);  
String uname=(String)session.getAttribute("name");

String s="select * from farmer where uname='"+uname+"'";

ResultSet rs1=st.executeQuery(s);
if(rs1.next())
{
	

String sql1="select * from connection where cid ="+id;
ResultSet rs4=st.executeQuery(sql1);
if(rs4.next())
{
    String username=rs4.getString("dname");


%>

  
<div class="main-block">
        <h1>Feedback</h1>
        <form action="addreport.jsp">
          <div class="info">
            <div class="info-item">
              <label class="icon" for="name"><i class="fas fa-user"></i></label>
              <input type="text" name="name" id="name" placeholder="<%=username%> " value="<%=username%>"/>
            </div>
          
          <div class="grade-type">
            <h3>Give rating</h3>
            <div> 
              <input type="radio" value="genuine" id="radioOne" name="grade" checked/>
              <label for="radioOne" class="radio">Genuine</label>
            </div>
            <div>
              <input type="radio" value="fraud" id="radioTwo" name="grade" />
              <label for="radioTwo" class="radio">Fraud</label>
            </div>
            <div>
       
           
          </div>
          <h3>Please Comment Your opinion</h3>
          <textarea rows="4"  name="opn"></textarea>
          <button type="submit" href="/">Submit</button>
        </form>
      </div>
      
      
      
     <%
  
 }
else
{
	
	
	
	
	
}
}
else
{
String sql1="select * from connection where cid ="+id;
ResultSet rs5=st.executeQuery(sql1);
if(rs5.next())
{
	    String username=rs5.getString("fname");

%>





	<div class="main-block">
    <h1>Feedback</h1>
    <form action="dreport.jsp">
      <div class="info">
        <div class="info-item">
          <label class="icon" for="name"><i class="fas fa-user"></i></label>
          <input type="text" name="name" id="name" placeholder="<%=username%> " value="<%=username%>"/>
        </div>
      
      <div class="grade-type">
        <h3>Give rating</h3>
        <div> 
          <input type="radio" value="genuine" id="radioOne" name="grade" checked/>
          <label for="radioOne" class="radio">Genuine</label>
        </div>
        <div>
          <input type="radio" value="fraud" id="radioTwo" name="grade" />
          <label for="radioTwo" class="radio">Fraud</label>
        </div>
        <div>
   
       
      </div>
      <h3>Please Comment Your opinion</h3>
      <textarea rows="4"  name="opn"></textarea>
      <button type="submit" href="/">Submit</button>
    </form>
  </div>
	
	
<%	
}else
	
{
	
}
}
  %> 
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