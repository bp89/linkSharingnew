<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 28/5/14
  Time: 5:09 PM
--%>

<%@ page import="linksharing.SecretQuestion" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>Secret Question</title>
</head>

<body>
<div id="create-forgotResource" class="content scaffold-create" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:hasErrors bean="${secretQuestionCO}">
        <ul class="errors" role="alert">
            <g:eachError bean="${secretQuestionCO}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form controller="user" action="submitSecretQuestion">

        <fieldset class="form">
            <div class="fieldcontain ${hasErrors(bean: secretQuestionCO, field: 'secretQuestion', 'error')} required">
                <label for="secretQuestion">
                    <g:message code="user.secretQuestion.label" default="Enter your Secret Question" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="secretQuestion" name="secretQuestion.id" from="${SecretQuestion.list().sort({l1,l2 -> l1.question<=>l2.question})}" optionKey="id" optionValue="question" required="" value="${params.secretQuestionCO.secretQuestion.id}" class="many-to-one"/>
            </div>
            <div class="fieldcontain ${hasErrors(bean: secretQuestionCO, field: 'answer', 'error')} required">
                <label for="answer">
                    <g:message code="user.answer.label" default="Answer" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="answer" value="${params.secretQuestionCO.answer}" placeholder="Enter your answer." style="width: 400px;height: 30px" />
            </div>
        </fieldset>

        <fieldset class="button" style="float: left ">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.save.label', default: 'Save')}" />
        </fieldset>
    </g:form>
</div>
%{-- <img style="float: right    " src="${resource(dir: 'images', file: 'confused-man.jpg')}" alt="Link Image" height="253" width="300"/>--}%
%{-- <h6> A mail has been sent to your registered Email address.</h6>--}%
</div>
</body>
</html>