<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.camplus.entity.User" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hot Comment | Camplus</title>
    <!-- bootstrap css -->
    <link href="/camplus/external/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap js -->
    <script src="/camplus/external/jQuery/jquery-1.11.3.min.js"></script>
    <script src="/camplus/external/bootstrap/js/bootstrap.min.js"></script>
    <!-- custom -->
    <link rel="stylesheet" type="text/css" href="/camplus/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="/camplus/css/gallery.css">
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
                    <li ><a href="/camplus/jsp/index.jsp">Home</a></li>
                    <li><a href="<c:url value="/carpool/select"></c:url>">Carpool</a></li>
                    <li><a href="/camplus/jsp/CourseDiscussion/courseSearch.jsp">Course</a></li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown">Gallery<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/gallery"></c:url>">Album</a></li>
                            <li class="active"><a href="<c:url value="/gallery/hotComment"></c:url>">Hot</a></li>
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
    <div class="container body">
        <div class="page-header text-center">
            <h1>Hot Comments</h1>
            <p>See the hot comments about the pictures.</p>
        </div>
        <div class="center">
            <br>
            <div id="masonry" class="container-fluid">
                <!-- TODO: 一个box为一个单位，动态添加图片和评论 -->
                <c:forEach items="${comments}" var="var">
                <div class="box">
                    <div class="thumbnail">
                        <br>
                        <div class="text-center">
                            <div class="circle"></div>
                        </div>
                        <div class="caption text-center">
                            <!-- TODO: 填入图片 -->
                            <a href="#" data-toggle="modal" data-target="#myModal"><img class="img-responsive" src="/camplus/images/gallery/s${var.galleryImgId}.png"></a>
                            <hr>
                            <!-- TODO: 填入评论 -->
                            <div>${var.galleryCommentContent}</div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        <div>
            <nav>
                <!-- TODO: 翻页功能 -->
                <ul class="pager">
    <li><form action="/camplus/gallery/hotComment" method="get">
      <input type="submit" name="indexmove" value="head"/>
    </form></li>
    <li><form action="/camplus/gallery/hotComment" method="get">
      <input type="submit" name="indexmove" value="prev"/>
    </form></li>
    <li><form action="/camplus/gallery/hotComment" method="get">
      <input type="text" name="indexmove" value="${sessionScope.index+1}" />
      <input type="submit" value="Go"/>
    </form></li>
    <li><form action="/camplus/gallery/hotComment" method="get">
      <input type="submit" name="indexmove" value="next"/>
    </form></li>
    <li>
    <form action="/camplus/gallery/hotComment" method="get">
      <input type="submit" name="indexmove" value="tail"/>
    </form></li>
                </ul>
            </nav>
        </div>
    </div>
    
    <hr>
    <footer class="home-footer">
        <div class="home-footer-text">
            <p>Address: 4800 Cao An Road, Jiading District, Shanghai</p>
            <p>email: Fowafolo@gmail.com</p>
            <p>&copy; 2015-2016  &middot; <a href="home">Camplus</a> &middot; All rights reserved.</p>
        </div>
    </footer>

    <!-- Modal -->
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">View Picture</h4>
                </div>
                <div class="modal-body">
                    <!-- TODO: 填入图片 -->
                    <a href="" data-toggle="modal" data-target="#myModal"><img class="img-responsive" src="/camplus/images/carousel-1.jpg"></a>
                    <h4>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="/camplus/external/jQuery/jquery.masonry.min.js"></script> 
    <script type="text/javascript">
        $(function(){
            var $container = $('#masonry');
            $container.imagesLoaded( function(){
                $container.masonry({
                    itemSelector : '.box',
                    gutterWidth : 0,
                    isAnimated: true,
                });
            });
        });
    </script>
</body>
</html>