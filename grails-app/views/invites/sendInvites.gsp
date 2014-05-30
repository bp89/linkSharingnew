<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 26/5/14
  Time: 3:03 PM
--%>

<%@ page import="linksharing.resource.Topic" contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>
<body>

<table style="border: 1px double #117700;background-color: #fff8c1">
    <tr>
        <td>
            <b>Note:</b>
        </td>
    </tr>
    <tr>
        <td>
            <ul style="list-style-type: lower-roman;margin-left: 40px">
                <li>
                    <h5>Enter semicolon separated Email Ids to send Invites.</h5>
                </li>
            </ul>

        </td>
    </tr>

</table>



<g:form  action="invite" >
    <fieldset class="form">
        <div>
        <label for="sendInvite">Topic</label>
        <g:select id="topic" name="topic.id" from="${Topic.list().sort({l1,l2 -> l1.name<=>l2.name})}" optionKey="id" optionValue="name" required="" value="${Topic.list()?.id}" class="many-to-one"/>
        </div>
        <div>
        <label for="sendInvite">Send Invites</label>
            <g:textField name="sendInvite" id="sendInvite" value="" placeholder="Enter Email Ids." style="width:800px;height: 30px"/>
        </div>
    </fieldset>
    <fieldset class="button" style="float: left">
        <g:submitButton name="send" class="save" value="${message(code: 'default.button.send.label', default: 'Send')}" />
    </fieldset>
</g:form>

</body>
</html>