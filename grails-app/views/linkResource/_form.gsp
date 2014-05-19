<%@ page import="linksharing.resource.LinkResource" %>



<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="linkResource.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${linkResourceInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'link', 'error')} required">
	<label for="link">
		<g:message code="linkResource.link.label" default="Link" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="link" required="" value="${linkResourceInstance?.link}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="linkResource.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${linkResourceInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="linkResource.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${linksharing.resource.Topic.list()}" optionKey="id" required="" value="${linkResourceInstance?.topic?.id}" class="many-to-one"/>

</div>

