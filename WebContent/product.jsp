<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="CSS/home.css">
<link rel="stylesheet" href="CSS/hom2.css">
<link rel="stylesheet" href="CSS/home3.css">
<link rel="stylesheet" href="CSS/footer.css">
<link rel="stylesheet" href="CSS/profile.css">
</head>

<div class="header1">
       
  <img src="images/logo2.png" alt="logo" width="200" height="128"/> <h1>FarmDestiny</h1>
</div>
<div class="topnav">
 
 <a href="userhome.jsp">Home</a>
      <a class="button" href="Logoutserv" style="float:right">Logout</a>
 
 
</div>
<!------ Include the above in your HEAD tag ---------->
<body>
<div class="content">

<form action="addproduct.jsp" method="get">
<div class="header">
<center><h2>ADD  PRODUCT</h2></center>
</div>

<center>
<h2> Fill the below details</h2>
<table border="2" >
<tr><td width="100">Product Name :</td>
<td><input type="text" name="pname" required/></td></tr>
<tr><td>Product Description:</td>
<td><input type="text" name="pdes" required/></td></tr>
<tr><td>Category:</td>
<td><input type="text" name="pcat" required/></td></tr>
<tr><td>Quantity:</td>
<td><input type="text" name="pwght" required/></td></tr>

<tr><td>Exp-Date:</td>
<td><input type="text" name="pdate" required/></td></tr>

</table>
<input type="submit" value="Add Product"/>
<input type="reset" value="clear"/>
</form>
</center>

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

<script>
  function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
  }
  
  function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
  }
  </script>

</body>
</html>