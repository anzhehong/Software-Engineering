<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.camplus.entity.User" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Gallery Hot Comment || Home :: CPCoders</title>
  <link href='http://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet' type='text/css'>
  <meta name="keywords" content="Showcase Gallery iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
  <link rel="stylesheet" href="/camplus/CSS/gallery/reset.css" type="text/css" media="all" />

  <link href="/camplus/CSS/index/style.css" rel="stylesheet" type="text/css" media="all" />
  <link href="/camplus/CSS/index/JFFormStyle-1.css" rel="stylesheet" type="text/css" media="all" />
  <link href="/camplus/CSS/index/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
  <link href="/camplus/CSS/index/bootstrap.css" rel="stylesheet" type="text/css" media="all">

  <link type="text/css" rel="stylesheet" href="http://dreamtemplate.com/dreamcodes/buttons_css3/css/tsc_button_styles.css" />

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
  <link href='http://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet' type='text/css'>
  <meta name="keywords" content="Showcase Gallery iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
  <link rel="stylesheet" href="/camplus/CSS/gallery/reset.css" type="text/css" media="all" />
  <link rel="stylesheet" href="/camplus/CSS/gallery/style.css" type="text/css" media="all" />
  <link type="text/css" rel="stylesheet" href="http://dreamtemplate.com/dreamcodes/buttons_css3/css/tsc_button_styles.css" />
  <script type="text/javascript" src="/camplus/JavaScript/gallery/jquery.js"></script>
  <script type="text/javascript" src="/camplus/JavaScript/gallery/jquery.lightbox.js"></script>
  <link rel="stylesheet" type="text/css" href="/camplus/CSS/gallery/lightbox.css" media="screen" />
  <script type="text/javascript">
    $(function() {
      $('.gallery a').lightBox();
    });
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

<div class="blog-content">
  <div class="wrap">
    <div class="p-content">
      <c:forEach items="${comments}" var="var">
        <div class="box">
          <img src="/camplus/Images/gallery/s${var.galleryImgId}.png" alt="" />
          <h3>ImageId: ${var.galleryCommentId}</h3>
          <p>${var.galleryCommentContent}</p>
        </div>
      </c:forEach>

    </div>
  </div>
</div>
<div class="clearfix"> </div>

<div class="container">
  <div class="page-select">
    <div class="clearfix"></div>
    <form action="/camplus/gallery/hotComment" method="get">
      <input type="submit" name="indexmove" value="head"/>
    </form>
    <form action="/camplus/gallery/hotComment" method="get">
      <input type="submit" name="indexmove" value="prev"/>
    </form>
    <form action="/camplus/gallery/hotComment" method="get">
      <input type="text" name="indexmove" value="${sessionScope.index+1}" />
      <input type="submit" value="Go"/>
    </form>
    <form action="/camplus/gallery/hotComment" method="get">
      <input type="submit" name="indexmove" value="next"/>
    </form>
    <form action="/camplus/gallery/hotComment" method="get">
      <input type="submit" name="indexmove" value="tail"/>
    </form>
  </div>
</div>


<div class="footer">
  <div class="wrap">
    <div class="copy" style="font-weight: 900">
      &copy; 2015 All rights Reseverd | Design by CPCoders
    </div>
  </div>
</div>


</body>
</html>