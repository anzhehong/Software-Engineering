<%--
  Created by IntelliJ IDEA.
  User: jinmin
  Date: 15-6-9
  Time: 上午9:09
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dear Customer</title>
  <script language="JavaScript">
    function jump(){
      setTimeout(go,3000);
    }
    function go(){
      window.location.href="/camplus/carpool/select";
    }
  </script>
</head>
<body onload="jump();">

${givenMessage}

<br>

<a href="<c:url value="/carpool/select"/>">Redirection Automatically In 3 sec</a>

</body></html>