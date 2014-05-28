<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 27/5/14
  Time: 4:55 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>
<body>

<g:uploadForm url="[resource:documentResourceInstance, action:'save']" >
    <fieldset class="form">



        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
            <label for="password">
                <g:message code="user.password.label" default="Create a Password" />
                <span class="required-indicator">*</span>
            </label>
            <g:passwordField name="password" required="" value="${userInstance?.password}"/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
            <label for="passwordConfirm">
                <g:message code="user.password.label" default="Confirm your password" />
                <span class="required-indicator">*</span>
            </label>
            <g:passwordField name="passwordConfirm" required="" value=""/>

        </div>

    </fieldset>

    <fieldset class="button" style="float: left ">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </fieldset>
</g:uploadForm>
</body>
</html>