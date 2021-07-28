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

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/home.css">
        <link rel="stylesheet" href="CSS/hom2.css">
        <link rel="stylesheet" href="CSS/home3.css">
        <link rel="stylesheet" href="CSS/footer.css">
        <link rel="stylesheet" href="CSS/profile.css">

<style>
              input.hidden {
    position: absolute;
    left: -9999px;
}

</style>
</head>
<body>

<div class="header1">
       
       <img src="images/logo2.png" alt="logo" width="200" height="128"/> <h1>FarmDestiny</h1>
    </div>
    <div class="topnav">
       <a href="userhome.jsp">Home</a>
       <a class="button" href="Logoutserv" style="float:right">Logout</a>
    </div>
<%
int  id=Integer.parseInt(request.getParameter("id"));

String url="jdbc:mysql://localhost:3306/fd";
String user="root";
String password="passmysql";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection(url,user,password);
Statement st=con.createStatement();



String sql1="select * from purchase where pr_id ="+id;
ResultSet rs4=st.executeQuery(sql1);
if(rs4.next())
{
    String username=rs4.getString("fname");
    String s="select * from farmer where uname='"+username+"'";
    ResultSet rs=st.executeQuery(s);
    if(rs.next())
    {

%>

<div class="container">
	<div class="row">
		
        
        
       <div class="col-md-7 ">

<div class="panel panel-default">
  <div class="panel-heading">  <h4 >User Details</h4></div>
   <div class="panel-body">
       
    
        
            
              
              <br>
    
              <!-- /input-group -->
         
            <div class="col-sm-6">
            <h4 style="color:#00b1b1;"> <%=rs.getString("name") %> </h4></span>
              <span><p>Seller</p></span> 
             

                       
            </div>
            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">
    
              
<div class="col-sm-5 col-xs-6 tital " >User name</div><div class="col-sm-7 col-xs-6 "><%=rs.getString("uname") %></div>
     <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Contant No:</div><div class="col-sm-7"> <%=rs.getLong("mobno") %></div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Email:</div><div class="col-sm-7"> <%=rs.getString("email")%></div>
  <div class="clearfix"></div>
<div class="bot-border"></div>

<div class="col-sm-5 col-xs-6 tital " >Address:</div><div class="col-sm-7"><%=rs.getString("address")%><div>
  <%
    }
  String sql4="SELECT  count(* )FROM  connection where fname=?";
   PreparedStatement pt=con.prepareStatement(sql4);
  pt.setString(1, username);
  pt.execute();
  
  ResultSet rs3=pt.executeQuery();
  while(rs3.next())
  {

  %>
  
<span><p>Connections:<%=rs3.getInt(1)%></p></span> 
           <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
       
            
    </div> 
    </div>
</div>  
    <script>
              $(function() {
    $('#profile-image1').on('click', function() {
        $('#profile-image-upload').click();
    });
});       
              </script> 
       
  <%
}
}
else
{
	
	
}
  
  
%>     
       
       
       
       
       
       
       
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
                              family that helps our neighbors. We support other farmers who share our vision
                              of sustainable agriculture, and we work to be as selfsufficient as possible.</p>
                        </div>
                        
                    <p class="copyright">FarmDestiny © 2021</p>
                </div>
            </footer>
        </div>
</body>
</html>