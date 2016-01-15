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
    <link rel="stylesheet" type="text/css" href="/camplus/css/course.css">
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
                    <li class="active"><a href="/camplus/jsp/CourseDiscussion/courseSearch.jsp">Course</a></li>
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
    <c:set value="${course}" var="course"></c:set>
    <div class="container body">
        <div>
            <h1 class="text-center">Class Detail</h1>
            <!-- TODO: 填入课程名称和细节 -->
            <h3 class="text-center">${course.courseName}</h3>
            <br>
            <table class="table table-hover table-striped table-bordered detail">
                <tbody>
                    <tr>
                        <td>Class Number: </td>
                        <td><label>${course.courseId}</label></td>
                    </tr>
                    <tr>
                        <td>Credit Hour: </td>
                        <td><label>${course.courseCredit}</label></td>
                    </tr>
                    <tr>
                        <td>Class Hour: </td>
                        <td><label>${course.courseLearnTime}</label> lessons/week</td>
                    </tr>
                    <tr>
                        <td>Teacher Name: </td>
                        <td><label>${course.courseTeacherName}</label></td>
                    </tr>
                    <tr>
                        <td>Professional Title: </td>
                        <td><label>${course.courseTeacherProfessTitle}</label></td>
                    </tr>
                    <tr>
                        <td>Class Time: </td>
                        <td><label>${course.coursePlace}</label></td>
                    </tr>
                    <tr>
                        <td>Remarks: </td>
                        <td><label>${course.courseNote}</label></td>
                    </tr>
                    <tr>
                        <td>Illustration: </td>
                        <td><label>${course.courseDescription}</label></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <hr>
        <div class="text-center">
            <h1>Share Message</h1>
            <br>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                <h4>Share your opinions here:</h4>
            </div>
            <!-- TODO: 表单提交 -->
            <div class="panel-body">
                <form id="commentFrom" >
                    <div class="form-group">
                        <label>Title:</label>
                        <input type="text" class="form-control" name="msgtitle" placeholder="Your subject of message">
                    </div>
                    <div class="form-group">
                        <label>Message:</label>
                        <textarea type="text" name="msgcontent" class="form-control" placeholder="Your message..."></textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success text-right" id="msgSumbit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        <hr>
        <div class="text-center">
            <h1>Message Board</h1>
            <h4>View others' opinion on this class.</h4>
            <br>
        </div>
        <div class="center">
            <br>
            <div id="masonry" class="container-fluid">
                <!-- TODO: 一个box为一个单位，动态添加评论 -->
                <c:forEach items="${result}" var="result">
                <div class="box">
                    <div class="thumbnail">
                        <br>
                        <div class="text-center">
                            <div class="circle">
                                <img class="img-circle" src="/camplus/images/avatar/${result.messageGiverImageId}.jpg" width="120" height="120" id="avatar-img">
                            </div>
                        </div>
                        <div class="caption">
                            <h3 class="text-center"> ${result.courseMessage.courseMessTitle}</h3>
                            <hr>
                            <p>${result.courseMessage.courseMessContent}</p>
                            <hr>
                            <p class="text-right">Committed by <label>${result.courseMessage.courseMessGiverId}</label></p>
                            <p class="text-right">${result.courseMessage.courseMessGiverTime} </p>
                        </div>
                    </div>
                </div>
                 </c:forEach>
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
    <script type="text/javascript">
    $('#msgSumbit').click(function (event) {
        event.preventDefault();
        $.ajax({
                cache: true,
                type: "POST",
                url:"/camplus/courseDiscussion/commitMsg",
                data:$('#commentFrom').serialize(),
                async: false,
                error: function(request) {

                   window.location.reload();
                },
                success: function(data) {
                   window.location.reload();
                }
            });
        return false;
    });
    </script>
</body>
</html>