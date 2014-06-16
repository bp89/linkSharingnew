<%@ page import="linksharing.resource.Resource" %>



<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="resource.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${resourceInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="resource.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${resourceInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="resource.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${linksharing.resource.Topic.list()}" optionKey="id" required="" value="${resourceInstance?.topic?.id}" class="many-to-one"/>

</div>

