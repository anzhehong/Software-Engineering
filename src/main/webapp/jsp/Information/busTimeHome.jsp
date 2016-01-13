<%@ page import="com.camplus.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shuttle | Camplus</title>
    <!-- bootstrap css -->
    <link href="/camplus/external/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap js -->
    <script src="/camplus/external/jQuery/jquery-1.11.3.min.js"></script>
    <script src="/camplus/external/bootstrap/js/bootstrap.min.js"></script>
    <!-- custom -->
    <link rel="stylesheet" type="text/css" href="/camplus/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="/camplus/css/shuttle.css">
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
                            <li><a href="<c:url value="/restaurant"></c:url> ">Take Out</a></li>
                            <li class="active"><a href="<c:url value="/information/busTimeHome"></c:url>">Shuttle</a></li>
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
            <h1>Shuttle Bus Time Table</h1>
            <p>View the time table and get ready for trip.</p>
        </div>
        <div>
            <table class="table table-hover table-striped table-bordered">
                <thead>
                    <tr>
                        <th colspan="2">
                            Line 11&emsp;&emsp;
                            <button class="btn btn-success btn-sm" onclick="window.location.href='http://map.baidu.com/subways/index.html?c=shanghai'">Subway Map</button>
                        </th>
                        <th>Highway Bus</th>
                        <th>Offline bus</th>
                        <th colspan="2">Supermarket</th>
                    </tr>
                    <tr>
                        <td>Go</td>
                        <td>Return</td>
                        <td>Go</td>
                        <td>Go</td>
                        <td>Go</td>
                        <td>Return</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label class="underline">6:15</label><br><label class="underline">6:30</label><br>6:45</td>
                        <td class="underline">6:30<br>6:45</td>
                        <td></td>
                        <td>6:00</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>7:00<br>7:15<br>7:30<br>7:45</td>
                        <td>7:00<br>7:15<br>7:30<br>7:45</td>
                        <td>7:20</td>
                        <td><label class="underline">7:00</label><br>(6:40 in <br>Saturday)</td>
                        <td>7:51</td>
                        <td>7:15</td>
                    </tr>
                    <tr>
                        <td>8:00</td>
                        <td>8:00<br>8:15</td>
                        <td></td>
                        <td>8:00</td>
                        <td></td>
                        <td>8:30</td>
                    </tr>
                    <tr>
                        <td><label class="underline">9:00</label></td>
                        <td><label class="underline">9:15</label></td>
                        <td></td>
                        <td>9:00</td>
                        <td>9:06</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10:00</td>
                        <td>10:15</td>
                        <td>10:00</td>
                        <td><label class="underline">10:00</label></td>
                        <td>10:36</td>
                        <td>10:00</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>11:00</td>
                        <td></td>
                        <td>11:45</td>
                    </tr>
                    <tr>
                        <td>12:00</td>
                        <td>12:15</td>
                        <td>12:30</td>
                        <td>12:00</td>
                        <td>12:21</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><label class="underline">13:00</label></td>
                        <td><label class="underline">13:15</label></td>
                        <td></td>
                        <td>13:00</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>14:00</td>
                        <td>14:15</td>
                        <td></td>
                        <td>14:00</td>
                        <td>14:36</td>
                        <td>14:00</td>
                    </tr>
                    <tr>
                        <td><label class="underline">15:00</label></td>
                        <td><label class="underline">15:15</label></td>
                        <td>15:30</td>
                        <td>15:00<br><label class="underline">15:30</label></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>16:00</td>
                        <td>16:15</td>
                        <td></td>
                        <td>16:00</td>
                        <td>16:36</td>
                        <td>16:00</td>
                    </tr>
                    <tr>
                        <td><label class="underline">17:00</label></td>
                        <td><label class="underline">17:15</label></td>
                        <td>17:30</td>
                        <td>17:00</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>18:00</td>
                        <td>18:15</td>
                        <td></td>
                        <td>18:00</td>
                        <td>18:36</td>
                        <td>18:00</td>
                    </tr>
                    <tr>
                        <td><label class="underline">19:00</label></td>
                        <td><label class="underline">19:15</label></td>
                        <td></td>
                        <td>19:00</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><label class="underline">20:00</label><br>20:30</td>
                        <td><label class="underline">20:15</label><br>20:45</td>
                        <td></td>
                        <td>20:00<br>20:50</td>
                        <td></td>
                        <td>20:20</td>
                    </tr>
                    <tr>
                        <td>21:00</td>
                        <td>21:15</td>
                        <td></td>
                        <td>15:15<br><label class="underline">15:45</label></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>22:00</td>
                        <td>22:15</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
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