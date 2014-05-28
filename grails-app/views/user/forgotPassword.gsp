<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 21/5/14
  Time: 3:28 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>


<body style="background: #ffffff">
<div id="create-documentResource" class="content scaffold-create" role="main">
    <span style="text-align: center"> <b>Forgot your password?</b></span>
    <g:form>

        <fieldset class="form">
            Enter Your registered :
            <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'emailID', 'error')} required">
                <label for="emailID">
                    <g:message code="user.firstName.label" default="Email Id" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="emailID" required="" value="" placeholder="Enter your registered email ID." style="width: 400px;height: 30px"/>

            </div>
            <br/>Or
            <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userName', 'error')} required">
                <label for="emailID">
                    <g:message code="user.firstName.label" default="User ID" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="emailID" required="" value="" placeholder="Enter your registered user ID." style="width: 400px;height: 30px"/>
            </div>
        </fieldset>

        <fieldset class="button" style="float: left ">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.send.label', default: 'Send Email')}" />
        </fieldset>
    </g:form>
</div>
%{-- <img style="float: right    " src="${resource(dir: 'images', file: 'confused-man.jpg')}" alt="Link Image" height="253" width="300"/>--}%
%{-- <h6> A mail has been sent to your registered Email address.</h6>--}%
</div>
</body>
</html>