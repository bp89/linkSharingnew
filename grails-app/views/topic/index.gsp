
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
			<h1>

                <g:message code="default.list.label" args="[entityName]" />
                <span class="button">
                    <g:link controller="topic" action="create">Add New Topic</g:link>
                </span>
            </h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table style="table-layout: fixed">
			<thead>
					<tr>
                        <g:sortableColumn property="name" title="${message(code: 'topic.name.label', default: 'Name')}" />

                        <g:sortableColumn property="description" title="${message(code: 'topic.description.label', default: 'Description')}" />

						<g:sortableColumn property="visibility" title="${message(code: 'topic.visibility.label', default: 'Visibility')}" />

                        <th><g:message code="documentResource.action.label" default="Topic" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${topicInstanceList}" status="i" var="topicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td>${fieldValue(bean: topicInstance, field: "name")}</td>
                        <td style="word-wrap: break-word;width: 25%;text-overflow: ellipsis ;overflow: hidden" ><g:link style="word-wrap: normal" action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "description")}</g:link></td>
						<td>${fieldValue(bean: topicInstance, field: "visibility")}</td>
                        <td>
                            <g:link controller="topic" action="show">View</g:link>
                            <g:link controller="topic" action="delete">Delete</g:link>
                            <g:link controller="topic" action="edit">Modify</g:link>

                        </td>
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
