
<%@ page import="linksharing.resource.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="list-resource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'resource.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'resource.title.label', default: 'Title')}" />
					
						<th><g:message code="resource.topic.label" default="Topic" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${resourceInstanceList}" status="i" var="resourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${resourceInstance.id}">${fieldValue(bean: resourceInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: resourceInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: resourceInstance, field: "topic")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${resourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
