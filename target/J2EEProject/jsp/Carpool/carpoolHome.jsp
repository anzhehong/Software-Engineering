<%@ page import="com.camplus.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <title>Carpool 拼车区 | Home :: CPCoders</title>
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

  <script type="text/javascript" language="javascript">
    function showDetail(header){//show detail
      var contents = [];
      contents[0] = header.innerHTML;
      contents[1] = header.parentNode.nextSibling.nextSibling.innerHTML;
      header = header.parentNode.nextSibling.nextSibling.nextSibling.nextSibling;
      for(var i = 2 ; i != 8 && header != null ; ++i) {
        contents[i] = header.innerHTML;
        header = header.nextSibling.nextSibling;
      }

      //msgDiv
      var msgDiv = document.getElementById("msgDiv");
      msgDiv.style.marginTop = 10 + "px";
      //bgDiv
      var bgDiv = document.getElementById("bgDiv");
      bgDiv.style.width = document.body.offsetwidth + "px";
      bgDiv.style.height = screen.height + "px";
      //msgShut
      var msgShut = document.getElementById("msgShut");
      msgShut.onclick = function(){
        bgDiv.style.display = msgDiv.style.display = "none";
      }
      //content
      msgDiv.style.display = bgDiv.style.display = "block";
      var msgDetail = document.getElementById("msgDetail");
      msgDetail.innerHTML = "<p style='line-height:50px;font-size:30px;text-align:center'>订单详情</p>" +
      "<p style='margin-left: 20px' id='requestID'>订单号:"+ contents[0] +"</p>" +
      "<p style='margin-left: 20px'>出发地:"+ contents[1] +"</p>" +
      "<p style='margin-left: 20px'>目的地:"+ contents[2] +"</p>" +
      "<p style='margin-left: 20px'>出发时间:"+ contents[4] +"</p>" +
      "<p style='margin-left: 20px'>人数:"+ contents[5] +"</p>" +
      "<p style='margin-left: 20px'>车型:"+ contents[7] +"</p>" +
      "<p style='margin-left: 20px'>备注:"+ contents[6] +"</p>" +
      "<p style='margin-left: 20px' id='requestSource'>提交者:"+ contents[3] +"</p>";}
  </script>

</head>

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

<div class="booking-info">
  <h3>Carpool</h3>
</div>

<div class="booking-form">
  <!---strat-date-piker---->
  <link rel="stylesheet" href="css/jquery-ui.css" />
  <script src="/camplus/JavaScript/index/jquery-ui.js"></script>
  <script>
    $(function() {
      $( "#datepicker,#Cdatepicker" ).datepicker();
    });
  </script>
  <!---/End-date-piker---->
  <link type="text/css" rel="stylesheet" href="css/JFGrid.css" />
  <link type="text/css" rel="stylesheet" href="css/JFFormStyle-1.css" />
  <script type="text/javascript" src="js/JFCore.js"></script>
  <script type="text/javascript" src="js/JFForms.js"></script>
  <!-- Set here the key for your domain in order to hide the watermark on the web server -->
  <%--<script type="text/javascript">--%>
  <%--(function() {--%>
  <%--JC.init({--%>
  <%--domainKey: ''--%>
  <%--});--%>
  <%--})();--%>
  <%--</script>--%>
  <% %>
  <form action="/camplus/carpool/select" method="get">
  <div class="online_reservation">
    <div class="b_room">
      <div class="booking_room">
        <div class="reservation">
          <ul>
            <li  class="span1_of_1 left">
              <h5>From</h5>
              <div class="book_date">
                <select name="departure" id="departure" onchange="change_country(this.value)" class="frm-field required">
                  <c:forEach items="${places}" var="place">
                    <option value="${place.placeName}">${place.placeName}</option>
                  </c:forEach>
                </select>
              </div>
            </li>
            <li  class="span1_of_1 left">
              <h5>To</h5>
              <div class="book_date">
                <select name="destination" id="destination" onchange="change_country(this.value)" class="frm-field required">
                  <c:forEach items="${places}" var="place">
                  <option value="${place.placeName}">${place.placeName}</option>
                  </c:forEach>
                </select>
              </div>
            </li>
            <li  class="span1_of_1 left">
              <h5>Date</h5>
              <div class="book_date">
                  <input class="date" name="datepicker" id="datepicker" type="text" value="06/24/2015" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '06/24/2015';}" required=>
              </div>
            </li>
            <li  class="span1_of_4 left">
              <h5>Hour</h5>
              <div class="book_date">
                <select name="hour" id="hour" onchange="change_country(this.value)" class="frm-field required">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12" selected>12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                </select>
              </div>
            </li>
            <li  class="span1_of_4 left">
              <h5>Minute</h5>
              <div class="book_date">
                <select name="minute" id="minute" onchange="change_country(this.value)" class="frm-field required">
                  <option value="0">0</option>
                  <option value="5">5</option>
                  <option value="10">10</option>
                  <option value="15">15</option>
                  <option value="20">20</option>
                  <option value="25">25</option>
                  <option value="30" selected>30</option>
                  <option value="35">35</option>
                  <option value="40">40</option>
                  <option value="45">45</option>
                  <option value="50">50</option>
                  <option value="55">55</option>
                </select>
              </div>
            </li>
            <li class="span1_of_1">
              <h5>Person(s)</h5>
              <!----------start section_room----------->
              <div class="section_room">
                <select name="number" id="number" onchange="change_country(this.value)" class="frm-field required">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                </select>
              </div>
            </li>
            <li class="span1_of_3">
              <div class="date_btn">
                  <input type="submit" value="查找"style="font-size:18px;font-weight: bold;height: 40px;width:200px;background-color: #FFD700;border-radius: 6px"/>
              </div>
            </li>
            <div class="clearfix"></div>
          </ul>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
  <!---->
  </form>
</div>


<table>
  <thead>
    <td>订单号码</td>
    <td>出发地</td>
    <td>目的地</td>
    <td>提交者</td>
    <td>出发时间</td>
    <td>空缺人数</td>
  </thead>
  <tbody>
  <c:forEach items="${orders}" var="order">

    <tr>
      <td>
        <a href="#" onClick="showDetail(this)">${order.carpoolId}</a>
      </td>
      <td>${order.carpoolOriginPlace}</td>
      <td>${order.carpoolDestination}</td>
      <td>${order.carpoolSubscriber}</td>
      <td>${order.carpoolDepartureTime}</td>
      <td>${order.carpoolNumberOfStudent}</td>
      <td hidden='true'>${order.carpoolSpecialRequirement}</td>
      <td hidden='true'>${order.carpoolCarType}</td>
    </tr>
  </c:forEach>
</tbody>
<%
  if(request.getAttribute("departure")==null||request.getAttribute("destination")==null){
%>
</table>
<div class="container">
  <div class="page-select">
    <form action="/camplus/carpool/select" method="get">
      <input type="submit" name="indexmove" value="head"/>
    </form>
    <form action="/camplus/carpool/select" method="get">
      <input type="submit" name="indexmove" value="prev"/>
    </form>
    <form action="/camplus/carpool/select" method="get">
      <input type="text" name="indexmove" value="${totalpage}"/>
      <input type="submit" value="Go"/>
    </form>
    <form action="/camplus/carpool/select" method="get">
      <input type="submit" name="indexmove" value="next"/>
    </form>
    <form action="/camplus/carpool/select" method="get">
      <input type="submit" name="indexmove" value="tail"/>
    </form>
  </div>
</div>
<%
  }else{
%>
</table>
<div class="container">
  <div class="page-select">
    <form action="/camplus/carpool/select" method="get">
      <input type="hidden" name="departure" value="${requestScope.departure}"/>
      <input type="hidden" name="destination" value="${requestScope.destination}"/>
      <input type="submit" name="indexmove" value="head"/>
    </form>
    <form action="/camplus/carpool/select?departure=${requestScope.departure}&desination=${requestScope.destination}" method="get">
      <input type="hidden" name="departure" value="${requestScope.departure}"/>
      <input type="hidden" name="destination" value="${requestScope.destination}"/>
      <input type="submit" name="indexmove" value="prev"/>
    </form>
    <form action="/camplus/carpool/select?departure=${requestScope.departure}&desination=${requestScope.destination}" method="get">
      <input type="hidden" name="departure" value="${requestScope.departure}"/>
      <input type="hidden" name="destination" value="${requestScope.destination}"/>
      <input type="text" name="indexmove" value="${sessionScope.index+1}"/>
      <input type="submit" value="Go"/>
    </form>
    <form action="/camplus/carpool/select?departure=${requestScope.departure}&desination=${requestScope.destination}" method="get">
      <input type="hidden" name="departure" value="${requestScope.departure}"/>
      <input type="hidden" name="destination" value="${requestScope.destination}"/>
      <input type="submit" name="indexmove" value="next"/>
    </form>
    <form action="/camplus/carpool/select?departure=${requestScope.departure}&desination=${requestScope.destination}" method="get">
      <input type="hidden" name="departure" value="${requestScope.departure}"/>
      <input type="hidden" name="destination" value="${requestScope.destination}"/>
      <input type="submit" name="indexmove" value="tail"/>
    </form>
  </div>
</div>
<%
  }
%>
<form action="/camplus/carpool/new" method="get">
<div class="online_reservation">
  <div class="b_room">
    <div class="booking_room">
      <div class="reservation">
        <ul>
          <li  class="span1_of_1 left">
            <h5>From</h5>
            <div class="book_date">
              <select name="Cdeparture" id="Cdeparture" onchange="change_country(this.value)" class="frm-field required">
                <c:forEach items="${places}" var="place">
                  <option value="${place.placeName}">${place.placeName}</option>
                </c:forEach>
              </select>
            </div>
          </li>
          <li  class="span1_of_1 left">
            <h5>To</h5>
            <div class="book_date">
              <select name="Cdestination" id="Cdestination" onchange="change_country(this.value)" class="frm-field required">
                <c:forEach items="${places}" var="place">
                  <option value="${place.placeName}">${place.placeName}</option>
                </c:forEach>
              </select>
            </div>
          </li>
          <li  class="span1_of_1 left">
            <h5>Date</h5>
            <div class="book_date">
                <input class="date" name="Cdate" id="Cdatepicker" type="text" value="06/24/2015" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '06/24/2015';}" required=>
            </div>
          </li>
          <li  class="span1_of_4 left">
            <h5>Hour</h5>
            <div class="book_date">
              <select name="Chour" id="Chour" onchange="change_country(this.value)" class="frm-field required">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12" selected>12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
              </select>
            </div>
          </li>
          <li  class="span1_of_4 left">
            <h5>Minute</h5>
            <div class="book_date">
              <select name="Cminute" id="Cminute" onchange="change_country(this.value)" class="frm-field required">
                <option value="0">0</option>
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
                <option value="25">25</option>
                <option value="30" selected>30</option>
                <option value="35">35</option>
                <option value="40">40</option>
                <option value="45">45</option>
                <option value="50">50</option>
                <option value="55">55</option>
              </select>
            </div>
          </li>
          <li class="span1_of_1">
            <h5>Person(s)</h5>
            <!----------start section_room----------->
            <div class="section_room">
              <select name="Cnumber" id="Cnumber" onchange="change_country(this.value)" class="frm-field required">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
              </select>
            </div>
          </li>
          <li class="span1_of_1">
            <h5>Car Type</h5>
            <div class="book_date">
              <input type="text" name="cartype" id="cartype" onchange="change_country(this.value)" class="frm-field required">
            </div>
          </li>
          <li class="span1_of_5">
            <h5>Other Requirements</h5>

            <div class="book_date">
              <input type="text" name="requirement" id="requirement" onchange="change_country(this.value)" class="frm-field required">
            </div>
          </li>
          <li class="span1_of_3">
            <div class="date_btn">
                <input type="submit" value="添加" style="font-size:18px;font-weight: bold;height: 40px;width:200px;background-color: #FFD700;border-radius: 6px"/>
            </div>
          </li>
          <div class="clearfix"></div>
        </ul>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
</form>

<div id="bgDiv"></div>
<div id="msgDiv" style="background: #f5f5f5;border: thin solid #c5c5c5;border-radius: 6px;">
  <div id="msgDetail">
    <p></p>
  </div>
  <div style="text-align: center">
    <form action="/camplus/carpool/cancel" method="get">
      <input type="hidden" id = "id" name="oid" value = "">
      <input type="hidden" id = "requestOwner" name="ownerId" value = "">
      <script>
        var getRequest = function(){
          console.log(document.getElementById("requestID").innerHTML);
          document.getElementById("id").setAttribute("value",document.getElementById("requestID").innerHTML);
          document.getElementById("requestOwner").setAttribute("value",document.getElementById("requestSource").innerHTML);
        }

      </script>
      <input type="submit" id="msgCancel" value="撤销" onclick="getRequest()" style="margin: auto;font-size:18px;font-weight: bold;height: 40px;width:80px;background-color: #FFD700;border-radius: 6px"/>
      <input type="button" id="msgShut" value="关闭" style="margin: auto;font-size:18px;font-weight: bold;height: 40px;width:80px;background-color: #FFD700;border-radius: 6px">
    </form>
  </div>
</div>

</body>
</html>
