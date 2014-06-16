
<%@ page import="linksharing.resource.LinkResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-linkResource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="['Link']" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list linkResource">

                <g:if test="${linkResourceInstance?.title}">
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label"><g:message code="linkResource.title.label" default="Title" /></span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${linkResourceInstance}" field="title"/></span>

                    </li>
                </g:if>
			
				<g:if test="${linkResourceInstance?.link}">
				<li class="fieldcontain">
					<span id="link-label" class="property-label"><g:message code="linkResource.link.label" default="Link" /></span>
					
						<span class="property-value" aria-labelledby="link-label"><g:fieldValue bean="${linkResourceInstance}" field="link"/></span>
					
				</li>
				</g:if>
                <g:if test="${linkResourceInstance?.description}">
                    <li class="fieldcontain">
                        <span id="description-label" class="property-label"><g:message code="linkResource.description.label" default="Description" /></span>

                        <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${linkResourceInstance}" field="description"/></span>

                    </li>
                </g:if>

			
				<g:if test="${linkResourceInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="linkResource.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${linkResourceInstance?.topic?.id}">${linkResourceInstance?.topic.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>

            <g:form url="[resource:linkResourceInstance, action:'delete']" method="DELETE">
				<fieldset class="button" style="float: left">
					<g:link class="edit" action="edit" resource="${linkResourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>

		</div>
	</body>
</html>
