<%@ page import="com.camplus.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>Course Discussion 课程讨论 | Home :: CPCoders</title>
  <link href="/camplus/CSS/index/style.css" rel="stylesheet" type="text/css" media="all" />
  <link href="/camplus/CSS/index/JFFormStyle-1.css" rel="stylesheet" type="text/css" media="all" />
  <link href="/camplus/CSS/index/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
  <link href="/camplus/CSS/index/bootstrap.css" rel="stylesheet" type="text/css" media="all">
  <!-- web-font -->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
  <!-- web-font -->
  <!-- js -->
  <script src="/camplus/JavaScript/index/jquery.min.js"></script>
  <script src="/camplus/JavaScript/index/modernizr.custom.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
  <!-- js -->
  <script src="/camplus/JavaScript/index/modernizr.custom.js"></script>
  <!-- start-smoth-scrolling -->
  <script type="text/javascript" src="/camplus/JavaScript/index/move-top.js"></script>
  <script type="text/javascript" src="/camplus/JavaScript/index/easing.js"></script>
  <script type="text/javascript">
    jQuery(document).ready(function($) {
      $(".scroll").click(function(event){
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
      });
    });
  </script>
  <script type="text/javascript">
    function showsubmenu(li){
      var submenu=li.getElementsByTagName("ul")[0];
      submenu.style.display="block";
    }
    function hidesubmenu(li){
      var submenu=li.getElementsByTagName("ul")[0];
      submenu.style.display="none";
    }
  </script>
</head>

<body>
<%
  User currentUser = (User)session.getAttribute("userSession");
  String userName = currentUser.getUserName();
%>

<div class="headerChild">
  <div class="log">
    <div class="quit"><a href="<c:url value="/logout"></c:url>">Logout</a> </div>
    <p><a href="<c:url value="/user/editInfo"></c:url>">Hello,<%=userName%></a> </p>  </div>
  <div class="head-bg">
    <!-- container -->
    <div class="container">
      <div class="head-logo">
        <a href="/camplus/jsp/index.jsp"><img src="/camplus/Images/index/logo1.png" alt="" /></a>
      </div>
      <div class="top-nav">
        <span class="menu"><img src="/camplus/Images/index/menu.png" alt=""></span>
        <ul class="cl-effect-1">
          <li><a href="/camplus/jsp/index.jsp">Home</a></li>

          <li><a href="<c:url value="/carpool/select"></c:url> ">Carpool</a></li>
          <li><a href="/camplus/jsp/CourseDiscussion/courseSearch.jsp">Course</a> </li>
          <li onmouseover="showsubmenu(this)" onmouseout="hidesubmenu(this)"><a>Gallery</a>
            <ul class="submenu">
              <dd><a href="<c:url value="/gallery"></c:url> ">Album</a></dd>
              <dd><a href="<c:url value="/gallery/hotComment"></c:url> ">Hot</a></dd>
              <dd><a href="<c:url value="/gallery/mySpace"></c:url> ">MySpace</a></dd>
            </ul>
          </li>
          <li onmouseover="showsubmenu(this)" onmouseout="hidesubmenu(this)"><a>Information</a>
            <ul class="subMenu">
              <dd><a href="<c:url value="/information/locationHome"></c:url> ">Map</a></dd>
              <dd><a href="<c:url value="/restaurant"></c:url> ">Takeout</a></dd>
              <dd><a href="<c:url value="/information/busTimeHome"></c:url> ">Shuttle</a></dd>
            </ul>
          </li>
        </ul>
        <!-- script-for-menu -->
        <script>
          $( "span.menu" ).click(function() {
            $( "ul.cl-effect-1" ).slideToggle( 300, function() {
              // Animation complete.
            });
          });
        </script>
        <!-- /script-for-menu -->
      </div>
      <div class="clearfix"> </div>
    </div>
    <!-- //container -->
  </div>
</div>

<div class="booking-info">
  <h3>餐馆信息</h3>
</div>

<div class="online_reservation">
  <div class="b_room">
    <div class="booking_room">
      <div class="reservation">
        <ul>
          <li class="span1_of_1">
            <h5>餐馆名称</h5>
            <label style="color: white">${restaurant.restaurantName}</label><br><br>
          </li>
          <li class="span1_of_1">
            <h5>联系电话</h5>
            <label style="color: white">${restaurant.restaurantPhone}</label>
          </li>
          <li class="span1_of_3">
              <div class="date_btn">
                <form action="/camplus/restaurant">
                 <input type="submit" value="返回"/>
                </form>
              </div>
          </li>
          <div class="clearfix"></div>
        </ul>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>


<table>

  <div class="booking-info">
    <h3><br>菜品信息</h3>
  </div>
  <thead>
  <tr>
    <th>菜品样图</th>
    <th>菜品名称</th>
    <th>菜品信息</th>
    <th>菜品评分</th>
    <th>菜品价格</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${dishes}" var="var">
    <tr>
      <td><img src="/camplus/Images/dish/${var.dishImageId}.jpg"></td>
      <td>${var.dishName}</td>
      <td>${var.dishInfo}</td>
      <td>${var.dishScore}</td>
      <td>${var.dishPrice}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

</body>
</html>
