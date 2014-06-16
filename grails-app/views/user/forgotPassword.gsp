<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 21/5/14
  Time: 3:28 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>
<body style="background: #ffffff">
<g:form controller="user" action="sendResetMail">
    <div id="create-forgotResource" class="content scaffold-create bodyDiv" role="main">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <g:hasErrors bean="${forgotPasswordCO}">
            <ul class="errors" role="alert">
                <g:eachError bean="${forgotPasswordCO}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>

        <span style="text-align: center"> <b>Forgot your password?</b></span>


        <fieldset class="form">
            Enter Your registered :
            <div class="fieldcontain ${hasErrors(bean: forgotPasswordCO, field: 'emailID', 'error')} required">
                <label for="emailID">
                    <g:message code="user.firstName.label" default="Email Id" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="emailID"  value="" placeholder="Enter your registered email ID." style="width: 400px;height: 30px"/>

            </div>
            <br/>Or
            <div class="fieldcontain ${hasErrors(bean: forgotPasswordCO, field: 'userName', 'error')} required">
                <label for="userName">
                    <g:message code="user.firstName.label" default="User ID" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="userName" value="" placeholder="Enter your registered user ID." style="width: 400px;height: 30px"/>
            </div>
        </fieldset>


    </div>

    <fieldset class="button" style="float: left ">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.send.label', default: 'Send Email')}" />
    </fieldset>
</g:form>
%{-- <img style="float: right    " src="${resource(dir: 'images', file: 'confused-man.jpg')}" alt="Link Image" height="253" width="300"/>--}%
%{-- <h6> A mail has been sent to your registered Email address.</h6>--}%
</div>
</body>
</html>