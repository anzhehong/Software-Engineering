<%@ page import="com.camplus.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page contentType="text/html;charset=utf-8" language="java" %>--%>
<%@page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<c:set var="bp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Camplus</title>
    <!-- bootstrap css -->
    <link href="/camplus/external/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap js -->
    <script src="/camplus/external/jQuery/jquery-1.11.3.min.js"></script>
    <script src="/camplus/external/bootstrap/js/bootstrap.min.js"></script>
    <!-- custom -->
    <link rel="stylesheet" type="text/css" href="/camplus/CSS/navbar.css">
    <link rel="stylesheet" type="text/css" href="/camplus/CSS/index.css">
</head>
<body>
    <div class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=""></a>
            </div>
            <div class="collapse navbar-collapse" id="navbar">
                <!-- TODO: 这里要添加所有标签的URL -->
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/camplus/jsp/index.jsp">Home</a></li>
                    <li><a href="<c:url value="/carpool/select"></c:url>">Carpool</a></li>
                    <li><a href="/camplus/jsp/CourseDiscussion/courseSearch.jsp">Course</a></li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown">Gallery<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/gallery"></c:url>">Album</a></li>
                            <li><a href="<c:url value="/gallery/hotComment"></c:url>">Hot</a></li>
                            <li><a href="<c:url value="/gallery/mySpace"></c:url>">My space</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown">Information<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/information/locationHome"></c:url>">Map</a></li>
                            <li><a href="<c:url value="/restaurant"></c:url> ">Take Out</a></li>
                            <li><a href="<c:url value="/information/busTimeHome"></c:url>">Shuttle</a></li>
                        </ul>
                    </li>
                </ul>

          <%
                  User currentUser = (User)session.getAttribute("userSession");
                  String userName = currentUser.getUserName();
          %>


                <ul class="nav navbar-nav navbar-right">
                    <!-- TODO: 这里要处理一下session，现在注释的部分是没有登录的 -->
                   <!-- <button type="button" onclick="signup()" class="btn btn-signup navbar-btn">Sign up</button>
                    <button type="button" onclick="signin()" class="btn btn-signin navbar-btn">Sign in</button>-->
                     <li><a href="<c:url value="/user/editInfo"></c:url>"><%=userName%></a></li>
                    <li><a href="<c:url value="/logout"></c:url>"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a></li> 
                </ul>
            </div>
        </div>
    </div>
    <div id="carousel" class="carousel slide body" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel" data-slide-to="0" class="active"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
            <li data-target="#carousel" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="/camplus/images/carousel-1.jpg">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>This is camplus.</h1>
                        <p><a class="btn btn-success" href="#" role="button">Start your journey</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img src="/camplus/images/carousel-2.jpg">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>More than campus.</h1>
                        <p><a class="btn btn-success" href="<c:url value="/gallery/mySpace"></c:url>" role="button">Upload pictures</a></p>
                    </div>
                </div>
            </div>
            <div class="item">
                <img src="/camplus/images/carousel-3.jpg">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Better in campus.</h1>
                        <p><a class="btn btn-success" href="<c:url value="/information/locationHome"></c:url>" role="button">Watch maps!</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="container function">
        <h1 class="text-center">Our functions</h1>
        <p>More about what this can do for your business.</p>
        <div class="line"></div>
        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <div class="text-center">
                    <img src="/camplus/images/carpool.png" width=100>
                </div>
                <h3>Carpool</h3>
                <p>The limitation of shuttle buses and subway line brings us inconvenience.we have the carpool function for students to find the companion.
                </p>
            </div>
            <div class="col-md-4">
                <div class="text-center">
                    <img src="/camplus/images/course.png" width=100>
                </div>
                <h3>Course</h3>
                <p>During the course selection, students feel a lot of trouble choosing courses. Thus we provide the platform for students to communicate.
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-2">
                <div class="text-center">
                    <img src="/camplus/images/gallery.png" width=100>
                </div>
                <h3>Gallary</h3>
                <p>The scenery in Jiading Campus is gorgeous, so why not post your excellent work to the website and enjoy the compliments?
                </p>
            </div>
            <div class="col-md-4">
                <div class="text-center">
                    <img src="/camplus/images/information.png" width=100>
                </div>
                <h3>Information</h3>
                <p>We provide detailed information of the restaurants and offer detailed campus map for students to find somewhere we are interested in.
                </p>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="line"></div>
        <h3 class="text-center">Contact us</h3>
        <p>If you have any questions about us, please send us an email.</p>
        <br>
        <!-- TODO: 发送邮件的接口 -->
            <div class="search">
                <form action="<c:url value="/sendMail"></c:url>"  method="post">
                    <textarea type="text" name="messageToSend" placeholder="Message to be sent..." cols="50" rows="3"></textarea>
                    <input type="submit" class="button btn-large btn-info" value="Send Us Email">
                </form>
            </div>
    </div>
    
    <hr>
    <footer class="home-footer">
        <div class="home-footer-text">
            <p>Address: 4800 Cao An Road, Jiading District, Shanghai</p>
            <p>email: Fowafolo@gmail.com</p>
            <!-- TODO: 添加camplus的url -->
            <p>&copy; 2015-2016  &middot; <a href="#">Camplus</a> &middot; All rights reserved.</p>
        </div>
    </footer>
</body>
</html>