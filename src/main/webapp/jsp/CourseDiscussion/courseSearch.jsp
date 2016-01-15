<%@ page import="com.camplus.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course | Camplus</title>
    <!-- bootstrap css -->
    <link href="/camplus/external/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap js -->
    <script src="/camplus/external/jQuery/jquery-1.11.3.min.js"></script>
    <script src="/camplus/external/bootstrap/js/bootstrap.min.js"></script>
    <!-- custom -->
    <link rel="stylesheet" type="text/css" href="/camplus/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="/camplus/css/carpool.css">
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
                    <li class="active"><a href="/camplus/courseDiscussion/search?courseName=&teacherName=">Course</a></li>
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
    <div class="container body">
        <div class="page-header text-center">
            <h1>Course</h1>
            <p>View courses and share opinions.</p>
        </div>
        <div class="row">
            <div class="col-md-3">
                <!-- TODO: form的提交 -->
                <form action="/camplus/courseDiscussion/search" method="get">
                    <div class="panel panel-success">
                        <div class="panel-heading text-center">
                            <h4>Find Courses</h4>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label>Course Name:</label>
                                <input class="form-control" type="text" name="courseName" placeholder="Enter the name of course">
                            </div>
                            <div class="form-group">
                                <label>Teacher Name:</label>
                                <input class="form-control" type="text" name="teacherName" placeholder="Enter the name of teacher">
                            </div>
                            <div class="text-center">
                                <button class="btn btn-success">Find</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-body">
                        
                        <table class="table table-hover table-striped">
                            <thead>
                                <td>Course Number</td>
                                <td>Course Name</td>
                                <td>Credit Hour</td>
                                <td>Teacher Name</td>
                                <td>Time</td>
                                <td>Details</td>
                            </thead>
                            <tbody>
                                <!-- TODO: 用c tag循环填入内容 -->
                                  <c:forEach items="${course}" var="course">
                                <tr>
                                    <td >${course.courseId}</td>
                                    <td>${course.courseName}</td>
                                    <td>${course.courseLearnTime}</td>
                                    <td>${course.courseTeacherName}</td>
                                    <td>${course.coursePlace}</td>
                                    <!-- TODO: 记得这个 window.location 改一下URL -->
                                    <td><button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal" onclick="window.location='<c:url value="/courseDiscussion/showDetail">
                                     <c:param name="action" value="nameDetail"></c:param>
                                     <c:param name="courseId" value="${course.courseId}"></c:param>
                                     <c:param name="index" value=""></c:param>
                                      </c:url>'">Comment</button></td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
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
</body>
</html>