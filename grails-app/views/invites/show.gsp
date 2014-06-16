
<%@ page import="linksharing.Invites" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'invites.label', default: 'Invites')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

<div id="show-invites" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list invites">

        %{--<g:if test="${invitesInstance?.acceptedOn}">--}%
        <li class="fieldcontain">
            <span id="acceptedOn-label" class="property-label"><g:message code="invites.acceptedOn.label" default="Accepted On" /></span>
            <span class="property-value" aria-labelledby="acceptedOn-label">
                <g:if test="${invitesInstance?.acceptedOn == ''}">
                    Not accepted Yet
                </g:if>
                <g:else>
                    <g:formatDate date="${invitesInstance?.acceptedOn}" format="EEE, d MMM yyyy HH:mm:ss"/>
                </g:else>
            </span>

        </li>
    %{--</g:if>--}%

        <g:if test="${invitesInstance?.sentBy}">
            <li class="fieldcontain">
                <span id="sentBy-label" class="property-label"><g:message code="invites.sentBy.label" default="Sent By" /></span>

                <span class="property-value" aria-labelledby="sentBy-label">
                    %{--<g:link controller="user" action="show" id="${invitesInstance?.sentBy?.id}">--}%
                    ${invitesInstance?.sentBy.firstName?.encodeAsHTML()} ${invitesInstance?.sentBy.lastName?.encodeAsHTML()}
                    %{--</g:link>--}%
                </span>

            </li>
        </g:if>

        <g:if test="${invitesInstance?.sentOn}">
            <li class="fieldcontain">
                <span id="sentOn-label" class="property-label"><g:message code="invites.sentOn.label" default="Sent On" /></span>
                <span class="property-value" aria-labelledby="sentOn-label"><g:formatDate date="${invitesInstance?.sentOn}" format="EEE, d MMM yyyy HH:mm:ss"/></span>
            </li>
        </g:if>

        <g:if test="${invitesInstance?.sentTo}">
            <li class="fieldcontain">
                <span id="sentTo-label" class="property-label"><g:message code="invites.sentTo.label" default="Sent To" /></span>

                <span class="property-value" aria-labelledby="sentTo-label">
                    %{--<g:link controller="user" action="show" id="${invitesInstance?.sentTo?.id}">--}%

                    ${invitesInstance?.sentTo.firstName?.encodeAsHTML()} ${invitesInstance?.sentTo.lastName?.encodeAsHTML()}
                    %{--</g:link>--}%
                </span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource:invitesInstance, action:'delete']" method="DELETE">
        <fieldset class="button" style="float: left">
            <g:link class="edit" action="edit" resource="${invitesInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
