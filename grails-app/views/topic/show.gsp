
<%@ page import="linksharing.resource.LinkResource; linksharing.resource.DocumentResource; linksharing.resource.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <style type="text/css">


    </style>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="../css/colorbox.css" />

</head>
<body>
<span class="button" >
    <g:link class="group1" controller="documentResource" action="create"><span class="glyphicon glyphicon-plus"></span>Add Document</g:link>&nbsp;
    <g:link class="group1" controller="linkResource" action="create"><span class="glyphicon glyphicon-plus"></span>Add Link</g:link>
</span>

<div  class="content scaffold-show" role="main" style="margin-left: 10px;margin-right: 10px;margin-top: 30px">
    <h1>
        <g:message code="default.show.label" args="[entityName]" />

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
            <li class="fieldcontain" style="width: 800px;">
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

      %{--  <g:if test="${topicInstance?.resources}">--}%
            <li class="fieldcontain">
                <span id="resources-label" class="property-label" ><g:message code="topic.resources.label" default="Resources" /></span>

                <span class="property-value" aria-labelledby="visibility-label" >
                    <g:link title="Document Resources " controller="documentResource" action="index" params="['topicId':topicInstance.id]">
                        ${topicInstance?.findResources(DocumentResource)}
                    </g:link>
                    Document(s)
                </span>

                <span class="property-value" aria-labelledby="visibility-label">
                    <g:link title="Link Resources " controller="linkResource" action="index" params="['topicId':topicInstance.id]" >
                        ${topicInstance?.findResources(LinkResource)}
                    </g:link>
                    Link(s)
                </span>
                %{-- <g:each in="${topicInstance.resources}" var="r">
                     <span class="property-value" aria-labelledby="resources-label">
                         --}%%{--<g:link controller="linkResource" action="show" id="${r.id}">${r?.title.encodeAsHTML()}</g:link>--}%%{--

                     </span>
                 </g:each>--}%

            </li>
        %{--</g:if>--}%


    </ol>
    <g:form url="[resource:topicInstance, action:'delete']" method="DELETE">
        <fieldset class="button_Left" >
            <g:link class="edit" action="edit" resource="${topicInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
<script type="text/javascript" src="../js/jquery.colorbox.js"></script>

</body>
</html>
