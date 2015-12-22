<%--
  Created by IntelliJ IDEA.
  User: fowafolo
  Date: 15/5/11
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>


<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
  <meta charset="utf-8">
  <title>login||Camplus</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- CSS -->
  <link rel="stylesheet" href="/camplus/CSS/loginAndRegister/reset.css">
  <link rel="stylesheet" href="/camplus/CSS/loginAndRegister/supersized.css">
  <link rel="stylesheet" href="/camplus/CSS/loginAndRegister/style.css">

  <!-- Javascript -->
  <script src="/camplus/JavaScript/loginAndRegister/jquery-1.8.2.min.js"></script>
  <script src="/camplus/JavaScript/loginAndRegister/supersized.3.2.7.min.js"></script>
  <script src="/camplus/JavaScript/loginAndRegister/supersized-init.js"></script>
  <script src="/camplus/JavaScript/jquery.js"></script>
  <script src="/camplus/JavaScript/jquery.validate.js"></script>
  <script src="/camplus/JavaScript/loginAndRegister/customer-validate.js"></script>

  <%--<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>--%>


</head>

<body>

<div class="page-container">
  <h1>Log in</h1>
  <form action="/camplus/index" method="post" id="userLogin" style="color: #d04f24;">
    <input type="text" name="userId" class="userId" placeholder="Student Id" id="userId" style="font-weight: 900;">
    <input type="password" name="userPassword" class="userPassword" placeholder="Password" id="userPassword" style="font-weight: 900">
    <button type="submit"style="font-weight: 900">LogIn</button>
  </form>
  <div class="connect">
    <p>Or sign up  <a href="<c:url value="/register"/> ">here</a></p>
  </div>
</div>


</body>

</html>


