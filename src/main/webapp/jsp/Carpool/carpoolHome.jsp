<%@ page import="com.camplus.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <c:set var="bp" value="${pageContext.request.contextPath}"/>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Carpool | Camplus</title>
  <!-- bootstrap css -->
  <link href="${bp}/external/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap js -->
  <script src="${bp}/external/jQuery/jquery-1.11.3.min.js"></script>
  <script src="${bp}/external/bootstrap/js/bootstrap.min.js"></script>
  <!-- custom -->
  <link rel="stylesheet" type="text/css" href="${bp}/CSS/navbar.css">
  <link rel="stylesheet" type="text/css" href="${bp}/CSS/carpool.css">
  <link rel="stylesheet" type="text/css" href="${bp}/external/datepicker/css/bootstrap-datetimepicker.min.css">
  <script>
    function getCarpoolDetail(btn) {
      var orderid = $(btn).parent().prevAll("#orderid").text();
      $.ajax({
        url: "/camplus/carpool/detail",
        data: {
          orderId: orderid
        },
        type: "GET",
        dataType: "json",
        success: function(response) {
          $("#modal-orderid").html(response.carpoolId);
          $("#modal-departure").html(response.carpoolOriginPlace);
          $("#modal-destination").html(response.carpoolDestination);
          $("#modal-time").html(response.carpoolDepartureTime);
          $("#modal-vacancy").html(response.carpoolNumberOfStudent);
          $("#modal-cartype").html(response.carpoolCarType);
          $("#modal-comment").html(response.carpoolSpecialRequirement);
          $("#modal-person").html(response.carpoolSubscriber);
//          TODO: 返回数据加入contact
//          $("#modal-contact").html(response.car)
//          console.log(response);
        },
        error: function (xhr, status) {
          console.log("error");
        },
        complete: function (xhr, status) {
          console.log("completed");
        }
      });
    }
  </script>
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
      <ul class="nav navbar-nav">
        <li><a href="">Home</a></li>
        <li class="active"><a href="">Carpool</a></li>
        <li><a href="">Course</a></li>
        <li class="dropdown">
          <a href="#" data-toggle="dropdown">Gallery<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="">Album</a></li>
            <li><a href="">Hot</a></li>
            <li><a href="">My space</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" data-toggle="dropdown">Information<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="">Map</a></li>
            <li><a href="">Take Out</a></li>
            <li><a href="">Shuttle</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <!-- TODO: deal with session -->
        <!-- <button type="button" onclick="signup()" class="btn btn-signup navbar-btn">Sign up</button>
        <button type="button" onclick="signin()" class="btn btn-signin navbar-btn">Sign in</button> -->
        <li><a href="">Fowafolo An</a></li>
        <li><a href=""><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a></li>
      </ul>
    </div>
  </div>
</div>
<div class="container body">
  <div class="page-header text-center">
    <h1>Carpool</h1>
    <p>Find your mates to rent car together.</p>
  </div>
  <div class="row">
    <div class="col-md-3">
      <div>

        <!-- Nav tabs -->
        <ul class="nav nav-pills" role="tablist">
          <li role="presentation" class="active"><a href="#mate" aria-controls="mate" role="tab" data-toggle="tab">Find Mates</a></li>
          <li role="presentation"><a href="#order" aria-controls="order" role="tab" data-toggle="tab">Add Order</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="mate">
            <!-- TODO: form的提交 下面注释的一些c标签可以去掉注释使用 -->
            <form action="" method="get">
              <div class="panel panel-default">
                <div class="panel-body">
                  <div class="form-group">
                    <label>From:</label>
                    <select name="departure" class="form-control">
                      <c:forEach items="${places}" var="place">
                        <option value="${place.placeName}">${place.placeName}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>To:</label>
                    <select name="destination" class="form-control">
                      <c:forEach items="${places}" var="place">
                        <option value="${place.placeName}">${place.placeName}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Date and Time:</label>
                    <div class="input-group date form_datetime" data-date="2015-09-16T05:25:07Z" data-date-format="yyyy-mm-dd  HH:ii p" data-link-field="dtp_input1">
                      <input class="form-control" type="text" value="" readonly name="dateAndTime">
                      <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                      <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Person(s):</label>
                    <select name="number" class="form-control">
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                    </select>
                  </div>
                  <div class="text-center">
                    <button class="btn btn-success">Find</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div role="tabpanel" class="tab-pane" id="order">
            <!-- TODO: form的提交 下面注释的一些c标签可以去掉注释使用 -->
            <form action="" method="get">
              <div class="panel panel-default">
                <div class="panel-body">
                  <div class="form-group">
                    <label>From:</label>
                    <select name="departure" class="form-control">
                      <c:forEach items="${places}" var="place">
                        <option value="${place.placeName}">${place.placeName}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>To:</label>
                    <select name="destination" class="form-control">
                      <c:forEach items="${places}" var="place">
                        <option value="${place.placeName}">${place.placeName}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Date and Time:</label>
                    <div class="input-group date form_datetime" data-date="2015-09-16T05:25:07Z" data-date-format="yyyy-mm-dd  HH:ii p" data-link-field="dtp_input1">
                      <input class="form-control" type="text" value="" readonly name="dateAndTime">
                      <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                      <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Person(s):</label>
                    <select name="number" class="form-control">
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Car Type:</label>
                    <input class="form-control" type="text" value="" name="cartype">
                  </div>
                  <div class="form-group">
                    <label>Other Requirements:</label>
                                            <textarea class="form-control" type="text" value="" name="requirement">
                                            </textarea>
                  </div>
                  <div class="text-center">
                    <button class="btn btn-success">Add</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

      </div>
    </div>
    <div class="col-md-9">
      <div class="panel panel-default">
        <div class="panel-body">

          <table class="table table-hover table-striped">
            <thead>
            <td>Order Number</td>
            <td>Departure Place</td>
            <td>Destination</td>
            <td>Submit Person</td>
            <td>Departure Time</td>
            <td>Vacancies</td>
            <td>Details</td>
            </thead>
            <tbody>
            <c:forEach items="${orders}" var="order">
              <tr>
                <td id="orderid">${order.carpoolId}</td>
                <td>${order.carpoolOriginPlace}</td>
                <td>${order.carpoolDestination}</td>
                <td>${order.carpoolSubscriber}</td>
                <td>${order.carpoolDepartureTime}</td>
                <td>${order.carpoolNumberOfStudent}</td>
                <td><button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal" id="viewDetail" onclick="getCarpoolDetail(this)">View</button></td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
          <nav>
            <!-- TODO: 翻页功能 -->
            <ul class="pager">
              <li><a href="#" class="inverse">Head</a></li>
              <li><a href="#">Previous</a></li>
              <li><a href="#">Next</a></li>
              <li><a href="#" class="inverse">Tail</a></li>
            </ul>
          </nav>
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

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">View Order</h4>
      </div>
      <div class="modal-body">
        <!-- TODO: 填内容 -->
        <table class="table order">
          <tbody>
          <tr><td>Order Number: </td><td id="modal-orderid">adfsd</td></tr>
          <tr><td>Departure Place: </td><td id="modal-departure"></td></tr>
          <tr><td>Destination: </td><td id="modal-destination"></td></tr>
          <tr><td>Departure Time: </td><td id="modal-time"></td></tr>
          <tr><td>Number of Vacancies: &nbsp;&nbsp;&nbsp;</td><td id="modal-vacancy"></td></tr>
          <tr><td>Car Type: </td><td id="modal-cartype"></td></tr>
          <tr><td>Comment: </td><td id="modal-comment"></td></tr>
          <tr><td>Submit Person: </td><td id="modal-person"></td></tr>
          <tr><td>Contact: </td><td id="modal-contact"></td></tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <!-- TODO: 加一个判断，如果已登陆用户＝订单发起用户，显示cancel button -->
        <button type="button" class="btn btn-primary">This car is full, cancel</button>
      </div>
    </div>
  </div>
</div>

<!-- date time picker -->
<script type="text/javascript" src="../../external/datepicker/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript">
  $('.form_datetime').datetimepicker({
    weekStart: 1,
    todayBtn:  1,
    autoclose: 1,
    todayHighlight: 1,
    startView: 2,
    forceParse: 0,
    showMeridian: 1
  });
</script>
</body>
</html>
