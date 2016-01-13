<%@ taglib prefix="value" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.camplus.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>

<head>
  <title>Gallery 摄影 | Home :: CPCoders</title>
  <%--<link href='http://fonts.googleapis.com/css?family=Anaheim' rel='stylesheet' type='text/css'>--%>
  <link href="/camplus/CSS/index/style.css" rel="stylesheet" type="text/css" media="all" />
  <link type="text/css" rel="stylesheet" href="http://dreamtemplate.com/dreamcodes/buttons_css3/css/tsc_button_styles.css" />
  <link href="/camplus/CSS/index/lightbox.css" rel="stylesheet" type="text/css" media="all">
  <script type="text/javascript" src="/camplus/JavaScript/gallery/jquery.js"></script>
  <script type="text/javascript" src="/camplus/JavaScript/gallery/jquery.lightbox.js"></script>
  <%--<script type="text/javascript">--%>
<%--//    $(function() {--%>
<%--//      $('.gallery a').lightBox(function () {--%>
<%--//        $('#jquery-lightbox').append('' +--%>
<%--//        '<div style="height: 300px; width: 800px; color:#fff; text-align: center;">' +--%>
<%--//        '<form action="" method="post">' +--%>
<%--//        '<textarea name="test" id="test-textarea" cols="30" rows="10" placeholder="Comment" style="height: 300px; width: 800px;">' +--%>
<%--//        '</textarea>' +--%>
<%--//        '<button type="submit" style="height: 100px;">Submit' +--%>
<%--//        '</button>' +--%>
<%--//        '</form>' +--%>
<%--//        '</div>')--%>
<%--//      });--%>
<%--//    });--%>
<script type="text/javascript">
$(function() {
  $('.gallery a').lightBox(function () {
    $('#lightbox-container-image-data').append('<div id="image-comment-textarea" class="commentbar"><form action="" method="post" id="comment-form"><textarea name="message" id="test-textarea" placeholder="Comment" cols="10"></textarea><div><button type="submit" style="margin-bottom:10px;text-align: center;font-size:14px;font-weight: bold;height: 40px;width:100px;background-color: #FFD700;border-radius: 6px">提交</button></div></form></div>')
    $('#comment-form').submit(function (e) {
      $(this).attr('action', 'gallery/comment?imageId=' + $('#lightbox-image').attr('data-imageid'));
    });
  });


});
  </script>
<%--//  </script>--%>

  <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>

  <link href="/camplus/CSS/index/JFFormStyle-1.css" rel="stylesheet" type="text/css" media="all" />
  <link href="/camplus/CSS/index/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
  <link href="/camplus/CSS/index/bootstrap.css" rel="stylesheet" type="text/css" media="all">

  <!-- web-font -->
  <!-- web-font -->
  <!-- js -->
  <%--<script src="/camplus/JavaScript/index/jquery.min.js"></script>--%>
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
<!-- header -->
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

<div class="gallery">
  <div class="wrap">
    <ul>
      <c:forEach var="var" items="${Images}">
        <li>
          <a href="/camplus/Images/gallery/${var.galleryImageId}.jpg" data-imageid="${var.galleryImageId}">
            <img src="/camplus/Images/gallery/s${var.galleryImageId}.png" alt="Image"/>
          </a>
        </li>
      </c:forEach>
      <div class="clear"></div>
    </ul>
  </div>
</div>

<div class="container">
  <div class="page-select">
    <div class="clearfix"></div>
    <form action="/camplus/gallery" method="get">
      <input type="submit" name="indexmove" value="head"/>
    </form>
    <form action="/camplus/gallery" method="get">
      <input type="submit" name="indexmove" value="prev"/>
    </form>
    <form action="/camplus/gallery" method="get">
      <input type="text" name="indexmove" value="${sessionScope.index+1}" />
      <input type="submit" value="Go"/>
    </form>
    <form action="/camplus/gallery" method="get">
      <input type="submit" name="indexmove" value="next"/>
    </form>
    <form action="/camplus/gallery" method="get">
      <input type="submit" name="indexmove" value="tail"/>
    </form>
  </div>
</div>

<div class="footer">
  <div class="wrap">
    <div class="copy">
      &copy; 2015 All rights Reseverd | Design by CPCoders
    </div>
  </div>
</div>

</body>
</html>

