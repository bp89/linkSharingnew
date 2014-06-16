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

<g:uploadForm url="[resource:updatePasswordCOInstance, action:'save']" >
    <fieldset class="form">


        <g:hasErrors bean="${updatePasswordCOInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${updatePasswordCOInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
            <label for="password">
                <g:message code="user.password.label" default="Create a New Password" />
                <span class="required-indicator">*</span>
            </label>
            <g:passwordField name="password" required="" value="${userInstance?.password}"/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
            <label for="passwordConfirm">
                <g:message code="user.password.label" default="Confirm your new password" />
                <span class="required-indicator">*</span>
            </label>
            <g:passwordField name="passwordConfirm" required="" value=""/>

        </div>

    </fieldset>

    <fieldset class="button" style="float: left ">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </fieldset>
    <g:hiddenField name="secretKeyToResetPassword"  value="${request.getAttribute('secretKeyToResetPassword')}"/>
    <g:hiddenField name="userID"  value="${request.getAttribute('userID')}"/>


</g:uploadForm>
</body>
</html>