
<%@ page import="linksharing.Invites" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'invites.label', default: 'Invites')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div id="list-invites" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" />
        <span class="button">
            <g:link controller="invites" action="sendInvites">Send Invites</g:link>
        </span>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <th><g:message code="invites.sentBy.label" default="Sent By" /></th>
            <g:sortableColumn property="sentOn" title="${message(code: 'invites.sentOn.label', default: 'Sent On')}" />
            <g:sortableColumn property="acceptedOn" title="${message(code: 'invites.acceptedOn.label', default: 'Accepted On')}" />
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${invitesInstanceList}" status="i" var="invitesInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${fieldValue(bean: invitesInstance, field: "sentBy.firstName")} ${fieldValue(bean: invitesInstance, field: "sentBy.lastName")}</td>
                <td><g:formatDate date="${invitesInstance.sentOn}" format="EEE, d MMM yyyy HH:mm:ss"/></td>
                <td>
                    <g:if test="${fieldValue(bean: invitesInstance, field: "acceptedOn") == ''}">
                        Not accepted Yet
                    </g:if>
                    <g:else>
                        ${fieldValue(bean: invitesInstance, field: "acceptedOn")}
                    </g:else>
                </td>
                <td>
                    <g:link class="actions" controller="invites" action="show" id="${invitesInstance.id}">
                        <img src="${resource(dir: "images",file: "view-512.png")}" height="20px" width="20px" title="View"/>
                    </g:link>
                    <g:link controller="invites" action="edit" id="${invitesInstance.id}">
                        <img src="${resource(dir: "images",file: "pencil1.png")}" height="20px" width="20px" title="Edit"/>
                    </g:link>
                    <g:link controller="invites" action="delete" id="${invitesInstance.id}">
                        <img src="${resource(dir: "images",file: "-trash.png")}" height="20px" width="20px" title="Delete"/>
                    </g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${invitesInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>
