
<%@ page import="linksharing.resource.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.answers}">
				<li class="fieldcontain">
					<span id="answers-label" class="property-label"><g:message code="question.answers.label" default="Answers" /></span>
					
						<g:each in="${questionInstance.answers}" var="a">
						<span class="property-value" aria-labelledby="answers-label"><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="question.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${questionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="question.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${questionInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.resourceSettings}">
				<li class="fieldcontain">
					<span id="resourceSettings-label" class="property-label"><g:message code="question.resourceSettings.label" default="Resource Settings" /></span>
					
						<g:each in="${questionInstance.resourceSettings}" var="r">
						<span class="property-value" aria-labelledby="resourceSettings-label"><g:link controller="resourceSettings" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="question.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${questionInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="question.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${questionInstance?.topic?.id}">${questionInstance?.topic?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.topics}">
				<li class="fieldcontain">
					<span id="topics-label" class="property-label"><g:message code="question.topics.label" default="Topics" /></span>
					
						<g:each in="${questionInstance.topics}" var="t">
						<span class="property-value" aria-labelledby="topics-label"><g:link controller="topic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="question.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${questionInstance?.user?.id}">${questionInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:questionInstance, action:'delete']" method="DELETE">
                <fieldset class="button_Left" >
					<g:link class="edit" action="edit" resource="${questionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
