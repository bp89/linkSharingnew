
<%@ page import="linksharing.resource.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <style type="text/css">


    </style>
</head>
<body>

<div id="show-topic" class="content scaffold-show" role="main">
    <h1>
        <g:message code="default.show.label" args="[entityName]" />
    <span class="button">


        <g:link controller="documentResource" action="create">Add Document</g:link>
        <g:link controller="linkResource" action="create">Add Link</g:link>
    </span>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list topic">

        <g:if test="${topicInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="topic.name.label" default="Name" /></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${topicInstance}" field="name"/></span>

            </li>
        </g:if>

        <g:if test="${topicInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="topic.description.label" default="Description" /></span>
                <span style='' class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${topicInstance}" field="description"/></span>

            </li>
        </g:if>




        <g:if test="${topicInstance?.visibility}">
            <li class="fieldcontain">
                <span id="visibility-label" class="property-label"><g:message code="topic.visibility.label" default="Visibility" /></span>

                <span class="property-value" aria-labelledby="visibility-label"><g:fieldValue bean="${topicInstance}" field="visibility"/></span>

            </li>
        </g:if>

        <g:if test="${topicInstance?.resources}">
            <li class="fieldcontain">
                <span id="resources-label" class="property-label"><g:message code="topic.resources.label" default="Resources" /></span>

                <g:each in="${topicInstance.resources}" var="r">
                    <span class="property-value" aria-labelledby="resources-label"><g:link controller="linkResource" action="show" id="${r.id}">${r?.title.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>


    </ol>
    <g:form url="[resource:topicInstance, action:'delete']" method="DELETE">
        <fieldset class="button" style="float: left">
            <g:link class="edit" action="edit" resource="${topicInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
