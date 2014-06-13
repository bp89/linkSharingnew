
<%@ page import="linksharing.SecretQuestion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secretQuestion.label', default: 'SecretQuestion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-secretQuestion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list secretQuestion">
			
				<g:if test="${secretQuestionInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="secretQuestion.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${secretQuestionInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:secretQuestionInstance, action:'delete']" method="DELETE">
				<fieldset class="button_Left" style="float: left">
					<g:link class="edit" action="edit" resource="${secretQuestionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
