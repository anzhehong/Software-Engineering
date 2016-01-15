<%@ page import="com.camplus.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Self Information | Camplus</title>
    <!-- bootstrap css -->
    <link href="../external/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap js -->
    <script src="../external/jQuery/jquery-1.11.3.min.js"></script>
    <script src="../external/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/selfinfo.js"></script>
    <!-- custom -->
    <link rel="stylesheet" type="text/css" href="/camplus/css/navbar.css">
    <link rel="stylesheet" type="text/css" href="/camplus/css/selfinfo.css">
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
                            <li><a href="<c:url value="/information/busTimeHome"></c:url>">Shuttle</a></li>
                        </ul>
                    </li>
                </ul>

          <%
                  User currentUser = (User)session.getAttribute("userSession");
                  String userName = currentUser.getUserName();
                  String userId = currentUser.getUserId();
                  String userAvator = currentUser.getUserAvator();
          %>


                <ul class="nav navbar-nav navbar-right">
                    <!-- TODO: 这里要处理一下session，现在注释的部分是没有登录的 -->
                   <!-- <button type="button" onclick="signup()" class="btn btn-signup navbar-btn">Sign up</button>
                    <button type="button" onclick="signin()" class="btn btn-signin navbar-btn">Sign in</button>-->
                     <li class="active"><a href="<c:url value="/user/editInfo"></c:url>"><%=userName%></a></li>
                    <li><a href="<c:url value="/logout"></c:url>"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a></li> 
                </ul>
            </div>
        </div>
    </div>
    <div class="container body">
        <div class="page-header text-center">
            <h1>Self Information</h1>
            <p>You can change your information here.</p>
        </div>
        <!-- TODO: 表单提交 -->
        <form method="post" action="/camplus/user/editInfoChanged" id="selfInfoChangeForm">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group" id="uid-form">
                        <div class="text-center">
                            <a href="javascript:void(0)" data-toggle="modal" data-target="#myModal"><img class="img-circle" src="/camplus/images/avatar/<%=userAvator%>.jpg" width="120" height="120" id="avatar-img"></a>
                        </div>
                        <!-- TODO: 这里我写好js了，会把选择的图片名字放在下面input的value里，拿value就好，初始的value和上面放图片的url相对 -->
                        <input type="text" style="display:none;" name="avatar" class="form-control" id="avatar" value="" contenteditable="false">
                    </div>
                    <div class="form-group" id="uid-form">
                        <label>Student Number:</label>
                        <input type="text"  name="uid" class="form-control" id="uid" value="<%=userId%>" contenteditable="false">
                    </div>
                    <div class="form-group" id="uname-form">
                        <label>User Name:</label>
                        <input type="text"  name="uname" class="form-control" id="uname" value="<%=userName%>" placeholder="need more than 6 characters...">
                        <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="form-group" id="pwd-form">
                        <label>Password:</label>
                        <input type="password"  name="password" class="form-control" id="password" value="" placeholder="need more than 6 characters...">
                        <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="form-group" id="re-pwd-form">
                        <label>Password:</label>
                        <input type="password"  name="repassword" class="form-control" id="repassword" value="" placeholder="need more than 6 characters...">
                        <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="form-group" id="contact-form">
                        <label>Contact Number:</label>
                        <input type="text"  name="contact" class="form-control" id="contact" value="">
                        <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success">Submit</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Choose an avatar for yourself!</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-3"><a href="javascript:void(0)" onclick="choosePic(1)"><img class="img-circle img-responsive" src="/camplus/images/avatar/1.jpg"></a></div>
                        <div class="col-xs-3"><a href="javascript:void(0)" onclick="choosePic(2)"><img class="img-circle img-responsive" src="/camplus/images/avatar/2.jpg"></a></div>
                        <div class="col-xs-3"><a href="javascript:void(0)" onclick="choosePic(3)"><img class="img-circle img-responsive" src="/camplus/images/avatar/3.jpg"></a></div>
                        <div class="col-xs-3"><a href="javascript:void(0)" onclick="choosePic(4)"><img class="img-circle img-responsive" src="../images/avatar/4.jpg"></a></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-xs-3"><a href="javascript:void(0)" onclick="choosePic(5)"><img class="img-circle img-responsive" src="/camplus/images/avatar/5.jpg"></a></div>
                        <div class="col-xs-3"><a href="javascript:void(0)" onclick="choosePic(6)"><img class="img-circle img-responsive" src="/camplus/images/avatar/6.jpg"></a></div>
                        <div class="col-xs-3"><a href="javascript:void(0)" onclick="choosePic(7)"><img class="img-circle img-responsive" src="/camplus/images/avatar/7.jpg"></a></div>
                        <div class="col-xs-3"><a href="javascript:void(0)" onclick="choosePic(8)"><img class="img-circle img-responsive" src="/camplus/images/avatar/8.jpg"></a></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
    <script type="text/javascript">
        function choosePic (index) {
            $("#avatar").attr("value",index);
            // TODO: 修改这里图片的路径
            $("#avatar-img").attr("src", "/camplus/images/avatar/" + index + ".jpg");
            $("#avatar").attr("value",index);
            $("#myModal").modal('hide');
        }    
    </script>
</body>
</html>