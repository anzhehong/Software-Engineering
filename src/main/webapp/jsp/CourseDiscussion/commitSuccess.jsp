<%--
  Created by IntelliJ IDEA.
  User: jinmin
  Date: 5/26/15
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<head>
  <title>Dear Customer</title>
  <script language="JavaScript">
    function jump(){
      setTimeout(go,3000);
    }
    function go(){
      window.location.href="/camplus/courseDiscussion/showDetail?courseId=${sessionScope.courseId}";
    }
  </script>
</head>
</head>
<body onload="jump();">
  ${userName}!
  Successfully Committed Your Message!
</body>
</html>
