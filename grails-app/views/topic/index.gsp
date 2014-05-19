
<%@ page import="linksharing.resource.Topic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-topic" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
                        <g:sortableColumn property="name" title="${message(code: 'topic.name.label', default: 'Name')}" />

                        <g:sortableColumn property="description" title="${message(code: 'topic.description.label', default: 'Description')}" />

						<g:sortableColumn property="visibility" title="${message(code: 'topic.visibility.label', default: 'Visibility')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topicInstanceList}" status="i" var="topicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: topicInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: topicInstance, field: "visibility")}</td>

                        %{--<td>${fieldValue(bean: topicInstance, field: "visibility")}</td>--}%
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${topicInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
