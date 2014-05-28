
<%@ page import="linksharing.resource.LinkResource" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<div id="list-linkResource" class="content scaffold-list" role="main">
    <h1>
        <g:message code="default.list.label" args="['Link']" />
        <span class="button">
            <g:link controller="linkResource" action="create">Add Link</g:link>
        </span>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="title" title="${message(code: 'linkResource.title.label', default: 'Title')}" />

            <g:sortableColumn property="link" title="${message(code: 'linkResource.link.label', default: 'Link')}" />

            <g:sortableColumn property="description" title="${message(code: 'linkResource.description.label', default: 'Description')}" />

            <th><g:message code="linkResource.topic.label" default="Topic" /></th>
            <th>Actions</th>

        </tr>
        </thead>
        <tbody>
        <g:if test="${linkResourceInstanceList ==null || linkResourceInstanceList.size() == 0}">
            <tr>
                <td colspan="6">No records found.</td>
            </tr>
        </g:if>
        <g:else>
            <g:each in="${linkResourceInstanceList}" status="i" var="linkResourceInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td>${fieldValue(bean: linkResourceInstance, field: "title")}</td>
                    <td><a target="_blank" href="${fieldValue(bean: linkResourceInstance, field: "link")}"/>${fieldValue(bean: linkResourceInstance, field: "link")}</a></td>
                    <td style="text-overflow: ellipsis"><g:link action="show" id="${linkResourceInstance.id}">${fieldValue(bean: linkResourceInstance, field: "description").toString()}</g:link></td>

                    <td>${fieldValue(bean: linkResourceInstance, field: "topic.name")}</td>
                    <td>
                        <g:link controller="linkResource" action="show" params="['id':linkResourceInstance.id]">
                            <img src="${resource(dir: "images",file: "view-512.png")}" height="20px" width="20px" title="View"/>
                        </g:link>
                        <g:link controller="linkResource" action="edit" params="['id':linkResourceInstance.id]">
                            <img src="${resource(dir: "images",file: "pencil1.png")}" height="20px" width="20px" title="Edit"/>
                        </g:link>
                        <g:link controller="linkResource" action="delete" params="['id':linkResourceInstance.id]">
                            <img src="${resource(dir: "images",file: "-trash.png")}" height="20px" width="20px" title="Delete"/>
                        </g:link>
                    </td>
                </tr>
            </g:each>
        </g:else>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${linkResourceInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>
