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
                    <li onmouseover="showsubmenu(this)" onmouseout="hidesubmenu(this)" ><a>Information</a>
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
    <h3>查找课程</h3>
</div>

<div class="online_reservation">
    <div class="b_room">
        <div class="booking_room">
            <div class="reservation">
                <form action="/camplus/courseDiscussion/search">
                    <ul>
                        <li class="span1_of_1">
                            <h5>课程名称</h5>
                            <div class="book_date">
                                <input type="text" id="courseName" name="courseName" placeholder="请输入课程名称" onchange="change_country(this.value)" class="frm-field required">
                            </div>
                        </li>
                        <li class="span1_of_1">
                            <h5>教师名称</h5>
                            <div class="book_date">
                                <input type="text" id="teacherName" name="teacherName" placeholder="请输入老师姓名" onchange="change_country(this.value)" class="frm-field required">
                            </div>
                        </li>
                        <li class="span1_of_3">
                            <div class="date_btn">
                                <%--<form>--%>
                                    <input type="submit" value="查找"style="font-size:18px;font-weight: bold;height: 40px;width:150px;background-color: #FFD700;border-radius: 6px"/>
                                <%--</form>--%>
                            </div>
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </form>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>



<table>
    <%--<caption>查找课程</caption>--%>
    <thead>
    <tr >
        <th>课程编号</th>
        <th>课程名称</th>
        <th>学时</th>
        <th>学分</th>
        <th>考试考查</th>
        <th>教师姓名</th>
        <th>教师职称</th>
        <th>上课时间地点</th>
        <th>课程备注</th>
        <th>说明</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${course}" var="course">
        <tr>
                <%--<td>${course.courseId}</td>--%>
            <td>
                <a href="
                 <c:url value="/courseDiscussion/showDetail">
                 <c:param name="action" value="nameDetail"></c:param>
                 <c:param name="courseId" value="${course.courseId}"></c:param>
                 <c:param name="index" value=""></c:param>
                  </c:url> ">${course.courseId}
                </a>
            </td>
            <td>${course.courseName}</td>
            <td>${course.courseLearnTime}</td>
            <td>${course.courseCredit}</td>
            <td>${course.courseExamPattern}</td>
            <td>${course.courseTeacherName}</td>
            <td>${course.courseTeacherProfessTitle}</td>
            <td>${course.coursePlace}</td>
            <td>${course.courseNote}</td>
            <td>${course.courseDescription}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
