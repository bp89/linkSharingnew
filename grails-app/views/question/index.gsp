
<%@ page import="linksharing.resource.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'question.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="question" title="${message(code: 'question.question.label', default: 'Question')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'question.title.label', default: 'Title')}" />
					
						<th><g:message code="question.topic.label" default="Topic" /></th>
					
						<th><g:message code="question.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionInstanceList}" status="i" var="questionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: questionInstance, field: "question")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "topic")}</td>
					
						<td>${fieldValue(bean: questionInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
