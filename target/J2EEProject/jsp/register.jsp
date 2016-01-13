<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
  <meta charset="utf-8">
  <title>-Camplus</title>
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
  <h1>Register</h1>
  <form action="<c:url value="/registerReturn"></c:url>" method="post" id="userRegister" style="color:#d04f24">
    <input type="text" name="userId" class="userId" placeholder="Student Id" style="font-weight: 900" id="userId">
    <input type="password" name="userPassword" class="userPassword" id="userPassword" placeholder="Password" style="font-weight: 900">
    <input type="password" name="userPasswordAgain" class="userPassword" id="userPasswordAgain" placeholder="Password Again" style="font-weight: 900">
    <input type="text" name="userName" class="userName" placeholder="Your Name" style="font-weight: 900">
    <button type="submit" style="font-weight: 900">Register</button>
  </form>
  <div class="connect">
    <p>Or Log In  <a href="<c:url value="/login"></c:url> ">here</a></p>
  </div>
</div>


</body>

</html>


