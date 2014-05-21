
<%@ page import="linksharing.resource.DocumentResource" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<div id="list-documentResource" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="['Document']" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="title" title="${message(code: 'documentResource.title.label', default: 'Title')}" />
            <g:sortableColumn property="fileName" title="${message(code: 'documentResource.fileName.label', default: 'Document Name')}" />
            <g:sortableColumn property="fileType" title="${message(code: 'documentResource.fileType.label', default: 'Document Type')}" />
            <g:sortableColumn property="description" title="${message(code: 'documentResource.description.label', default: 'Description')}" />
            <th><g:message code="documentResource.topic.label" default="Topic" /></th>
            <th>View / Download</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${documentResourceInstanceList}" status="i" var="documentResourceInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${fieldValue(bean: documentResourceInstance, field: "title")}</td>
                <td>${fieldValue(bean: documentResourceInstance, field: "fileName")}</td>
                <td>${fieldValue(bean: documentResourceInstance, field: "fileType")}</td>
                <td><g:link action="show" id="${documentResourceInstance.id}">${fieldValue(bean: documentResourceInstance, field: "description")}</g:link></td>
                <td>${fieldValue(bean: documentResourceInstance, field: "topic.name")}</td>
                <td> <g:link controller="documentResource" action="view">View</g:link>  / <g:link controller="documentResource" action="download">Download</g:link> </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${documentResourceInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>
