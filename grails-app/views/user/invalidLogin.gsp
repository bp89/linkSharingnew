<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 19/5/14
  Time: 9:20 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
{flash.put("logoutMessage","You have been logged out successfully.")}

Your session has timed out.
<a class="home" href="${createLink(uri: '/')}">Login</a>
</body>
</html>