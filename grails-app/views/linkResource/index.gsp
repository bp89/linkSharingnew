
<%@ page import="linksharing.resource.LinkResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-linkResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-linkResource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'linkResource.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="link" title="${message(code: 'linkResource.link.label', default: 'Link')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'linkResource.title.label', default: 'Title')}" />
					
						<th><g:message code="linkResource.topic.label" default="Topic" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${linkResourceInstanceList}" status="i" var="linkResourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${linkResourceInstance.id}">${fieldValue(bean: linkResourceInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: linkResourceInstance, field: "link")}</td>
					
						<td>${fieldValue(bean: linkResourceInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: linkResourceInstance, field: "topic")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${linkResourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
