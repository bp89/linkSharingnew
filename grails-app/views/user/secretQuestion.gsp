<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 28/5/14
  Time: 5:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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


<ol class="property-list secretQuestionCO">
    <li class="fieldcontain">
        <span id="title-label" class="property-label"><g:message code="documentResource.question.label" default="Question" /></span>
        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${params.secretQuestionCO}" field="secretQuestion.question"/></span>
    </li>
    <li class="fieldcontain">
        <span id="title-label" class="property-label"><g:message code="documentResource.answer.label" default="Answer" /></span>
        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${params.secretQuestionCO}" field="answer"/></span>
    </li>
    </ol>

    <fieldset class="button" style="float: left">
        <g:link class="edit" controller="user" action="configureSecretQuestion" resource="${params.secretQuestionCO}">
            <g:message code="default.button.edit.label" default="Edit" />
        </g:link>
    </fieldset>
</div>

</body>
</html>