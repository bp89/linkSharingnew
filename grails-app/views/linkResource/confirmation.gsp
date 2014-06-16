<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 9/6/14
  Time: 2:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link href="${resource(dir: 'css',file: 'bootstrap.css')}" rel="stylesheet">
    <link rel="stylesheet" href="../css/colorbox.css" />

</head>

<body>
<div class="bodyDiv">
    <h2>Confirmation</h2><hr>
    <h5>${message}</h5>
</div>

<span class="button" style="float: left">
    <button name="close" onclick="javascript:parent.$.colorbox.close();">Close</button>
</span>
<script type="text/javascript" src="../js/jquery.colorbox.js"></script>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>

</body>
</html>