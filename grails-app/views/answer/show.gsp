
<%@ page import="linksharing.resource.Answer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-answer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list answer">
			
				<g:if test="${answerInstance?.answer}">
				<li class="fieldcontain">
					<span id="answer-label" class="property-label"><g:message code="answer.answer.label" default="Answer" /></span>
					
						<span class="property-value" aria-labelledby="answer-label"><g:fieldValue bean="${answerInstance}" field="answer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="answer.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${answerInstance?.question?.id}">${answerInstance?.question?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${answerInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="answer.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${answerInstance?.user?.id}">${answerInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:answerInstance, action:'delete']" method="DELETE">
                <fieldset class="button_Left" >
					<g:link class="edit" action="edit" resource="${answerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
