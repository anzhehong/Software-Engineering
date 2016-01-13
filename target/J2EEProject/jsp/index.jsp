<%@ page import="com.camplus.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page contentType="text/html;charset=utf-8" language="java" %>--%>
<%@page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Camplus | Home :: CPCoders</title>
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
    <!-- start-smoth-scrolling -->
</head>

<body>
<!-- header -->

<%
    User currentUser = (User)session.getAttribute("userSession");
    String userName = currentUser.getUserName();
%>
<div class="header">
    <div class="log">
        <div class="quit"><a href="<c:url value="/logout"></c:url>">Logout</a> </div>
        <p><a href="<c:url value="/user/editInfo"></c:url>">Hello,<%=userName%></a></p>
    </div>

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
<!-- before -->
<div class="before">
    <!-- container -->
    <div class="container">
        <h2>Our functions</h2>
        <div class="before-grids">
            <div class="before-grid">
                <h3>Carpool & Exchange</h3>
                <p>The limitation of shuttle buses and subway line brings us inconvenience.we have the carpool function for students to find the companion.
                    Some students have lots of idle equipment while the other students may need them. And we have the function of exchanging items so that they can be better used.
                </p>
            </div>
            <div class="before-grid">
                <h3>Course & Information</h3>
                <p>During the course selection, students feel a lot of trouble choosing courses. Thus we provide the platform for students to communicate about the courses.
                    We provide detailed information of the restaurants. Moreover, we offer detailed campus map so that it will be easy for us to find somewhere we have seldom gone.
                </p>
            </div>
            <div class="before-grid">
                <h3>Gallary</h3>
                <p>The scenery in Jiading Campus is gorgeous, every spring the booming sakura and the cute cats everywhere are really beautiful. There is no lack of good photographers among us. Why not post your excellent work to the website and enjoy the compliments.
                </p>
            </div>
            <div class="clearfix"> </div>
            <div class="search">
                <p>Contact Us </p>
                <form action="<c:url value="/sendMail"></c:url>" method="post">
                    <input type="text" placeholder="Message..." required="" name="messageToSend">
                    <input type="submit" value="Send Us Email">
                </form>
            </div>
        </div>
    </div>
    <!-- //container -->
</div>
<!-- //before -->
<!-- footer -->
<div class="footer">
    <!-- container -->
    <div class="container">
        <div class="footer-left">
            <p>Designed by CPCoders</p>
        </div>
        <div class="footer-right">
            <div class="footer-nav">
                <ul>

                    <li><a href="/camplus/jsp/index.jsp">HOME</a></li>
                    <li><a href="/camplus/jsp/Carpool/carpoolHome.jsp">CARPOOL</a></li>
                    <!-- <li><a href="booking.html">EXCHANGE</a></li>  -->
                    <li><a href="/camplus/jsp/CourseDiscussion/courseSearch.jsp">COURSE</a> </li>
                    <li><a href="<c:url value="/gallery"/>">GALLARY</a></li>
                    <li><a href="/camplus/jsp/Information/index.jsp">INFORMATION</a></li>
                </ul>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
    <!-- //container -->
</div>
<!-- //footer -->
<script type="text/javascript">
    $(document).ready(function() {

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- content-Get-in-touch -->
</body>
</html>