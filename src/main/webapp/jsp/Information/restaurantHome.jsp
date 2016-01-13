<%@ page import="com.camplus.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Restaurant | Camplus</title>
    <!-- bootstrap css -->
    <link href="/camplus/external/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap js -->
    <script src="/camplus/external/jQuery/jquery-1.11.3.min.js"></script>
    <script src="/camplus/external/bootstrap/js/bootstrap.min.js"></script>
    <!-- custom -->
    <link rel="stylesheet" type="text/css" href="/camplus/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="/camplus/css/restaurant.css">
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
                            <li><a href="<c:url value="/gallery/hotComment"></c:url>">Hot</a></li>
                            <li><a href="<c:url value="/gallery/mySpace"></c:url>">My space</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown">Information<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<c:url value="/information/locationHome"></c:url>">Map</a></li>
                            <li class="active"><a href="<c:url value="/restaurant"></c:url> ">Take Out</a></li>
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
            <h1>Restaurant</h1>
            <p>Enjoy all kinds of delicious food.</p>
        </div>
        <div class="text-center">
            <!-- TODO: 表单提交 -->
            <form class="form-inline" action="/camplus/restaurant/search">
                <div class="form-group">
                    <input class="form-control" name="dishName" type="text" placeholder="Input dish name...">
                </div>
                <button class="btn btn-success">Search</button>
            </form>
        </div>
        <div class="row">
            <!-- TODO: 循环加入 -->
         <c:forEach items="${restaurants}" var="var">
            <div class="col-md-2 col-sm-3 col-xs-6">
                <div class="panel panel-default">
                    <div class="panel-body text-center">
                        <h2><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span></h2>
                        <h4><a href="
          <c:url value="/restaurant/get/${var.restaurantId}"></c:url>
        ">${var.restaurantName}
        </a></h4>
                        <p><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> ${var.restaurantPhone}</p>
                    </div>
                </div>
            </div>
             </c:forEach>
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

    <script type="text/javascript">
        var color = ["#fe0002","#c61d58","#cb138b","#994d8d","#860083","#003466","#3730a4","#326ac7","#047cff","#16a0aa","#249a8e","#318f77","#1c9467","#3d9338","#99cb34","#cdd541","#efef1e","#fdb700","#ff8d21","#f43d13"];
        function getColorByRandom(){
            var colorIndex = Math.floor(Math.random()*color.length);
            return colorIndex;
        }
        $(document).ready(function(){
            $("h2").each(function(){
                var index = getColorByRandom();
                $(this).css('color', color[index]);
            })
        })
    </script>
</body>
</html>