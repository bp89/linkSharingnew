<%@ page import="linksharing.resource.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="topic.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${topicInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="topic.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${topicInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'resources', 'error')} ">
	<label for="resources">
		<g:message code="topic.resources.label" default="Resources" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${topicInstance?.resources?}" var="r">
    <li><g:link controller="resource" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="resource" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resource.label', default: 'Resource')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'visibility', 'error')} required">
	<label for="visibility">
		<g:message code="topic.visibility.label" default="Visibility" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="visibility" required="" value="${topicInstance?.visibility}"/>

</div>

