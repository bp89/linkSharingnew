
<%@ page import="linksharing.resource.DocumentResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-documentResource" class="content scaffold-show" role="main">
			<h1>
                <g:message code="default.show.label" args="['Document']" />
            </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list documentResource">

                <g:if test="${documentResourceInstance?.title}">
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label"><g:message code="documentResource.title.label" default="Title" /></span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${documentResourceInstance}" field="title"/></span>

                    </li>
                </g:if>

                <g:if test="${documentResourceInstance?.fileName}">
                    <li class="fieldcontain">
                        <span id="fileName-label" class="property-label"><g:message code="documentResource.fileName.label" default="File Name" /></span>

                        <span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${documentResourceInstance}" field="fileName"/></span>

                    </li>
                </g:if>
                <g:if test="${documentResourceInstance?.fileType}">
                    <li class="fieldcontain">
                        <span id="fileType-label" class="property-label"><g:message code="documentResource.fileType.label" default="File Type" /></span>

                        <span class="property-value" aria-labelledby="fileType-label"><g:fieldValue bean="${documentResourceInstance}" field="fileType"/></span>

                    </li>
                </g:if>
				<g:if test="${documentResourceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="documentResource.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${documentResourceInstance}" field="description"/></span>
					
				</li>
				</g:if>


			
				<g:if test="${documentResourceInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="documentResource.topic.label" default="Topic" /></span>

						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${documentResourceInstance?.topic?.id}">${documentResourceInstance?.topic?.name.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:documentResourceInstance, action:'delete']" method="DELETE">
				<fieldset class="button" style="float: left">
					<g:link class="edit" action="edit" resource="${documentResourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
