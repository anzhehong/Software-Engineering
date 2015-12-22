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


<body>
<c:set value="${course}" var="course"></c:set>
<div class="booking-info">
  <h3>${course.courseTeacherName} - ${course.courseName} 讨论区</h3>
</div>

<table>
  <thead>
  <tr>
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
  <tr>
    <td>${course.courseId}</td>
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
  </tbody>
</table>

<table>
  <thead>
  <tr>
    <th>主题</th>
    <th>学号</th>
    <th>内容</th>
    <th>时间</th>
  </tr>
  </thead>
  <tbody>
    <c:forEach items="${message}" var="message">
      <tr>
        <td style="width: 200px"> ${message.courseMessTitle} </td>
        <td style="width: 80px"> ${message.courseMessGiverId} </td>
        <td style="width:700px"> ${message.courseMessContent} </td>
        <td style="width: 150px"> ${message.courseMessGiverTime} </td>
        <%--<td> ${message.courseMessAgree} </td>--%>
      </tr>
    </c:forEach>
  </tbody>
</table>

<form method="post" action="/camplus/courseDiscussion/commitMsg">
  <table>
    <tr>
      <td>主题</td>
      <td><textarea type="text" name="msgtitle" cols="100" rows="1"></textarea></td>
    </tr>
    <tr>
      <td>留言</td>
      <td><textarea type="text" name="msgcontent" cols="100" rows="5"></textarea></td>
    </tr>
  </table>
<div style="text-align: center">
  <input type="submit" name="Submit" value="提交" style="font-size:18px;font-weight: bold;height: 40px;width:100px;background-color: #FFD700;border-radius: 6px" />
</div>
</form>
</body>
</html>
