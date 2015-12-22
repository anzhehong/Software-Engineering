<%--
  Created by IntelliJ IDEA.
  User: jinmin
  Date: 5/26/15
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail</title>
</head>
<body>

  ${orderinfo.carpoolId}<br>
  ${orderinfo.carpoolOriginPlace}<br>
  ${orderinfo.carpoolDestination}<br>
  ${orderinfo.carpoolDepartureTime}<br>
  ${orderinfo.carpoolNumberOfStudent}<br>
  ${orderinfo.carpoolCarType}<br>
  ${orderinfo.carpoolSpecialRequirement}<br>

<form action="/camplus/carpool/cancel" method="post">
  <input hidden name="orderId" value="${orderinfo.carpoolId}"/>
  <input hidden name="ownerId" value="${orderinfo.carpoolSubscriber}"/>
  <br><br>
  <input type="submit" name="submit" value="Cancel"/>
</form>

</body>
</html>
