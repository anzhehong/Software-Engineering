
<%--
  Created by IntelliJ IDEA.
  User: jinmin
  Date: 15-6-10
  Time: 下午8:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Dear Customer</title>
  <script language="JavaScript">
    function jump(){
      setTimeout(go,1000);
    }
    function go(){
      window.location.href="/camplus/gallery";
    }
  </script>
</head>
<body onload="jump();">

${givenMessage}

<br>

<a href="<c:url value=" /camplus/gallery"/>">Redirection Automatically In 3 sec</a>

</body></html>