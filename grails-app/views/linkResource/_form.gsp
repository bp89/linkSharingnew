<%@ page import="linksharing.resource.LinkResource" %>


<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'topic', 'error')} required">
    <label for="topic">
        <g:message code="linkResource.topic.label" default="Topic" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="topic" name="topic.id" from="${linksharing.resource.Topic.list().sort({l1,l2 -> l1.name <=>l2.name })}" optionKey="id" required="" optionValue="name" value="${linkResourceInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="linkResource.title.label" default="Title" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${linkResourceInstance?.title}" placeholder="Link title "/>

</div>


<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'link', 'error')} required">
    <label for="link">
        <g:message code="linkResource.link.label" default="Link" />
        <span class="required-indicator">*</span>
    </label>
     <g:textField name="link" style="width:500px" required="" value="${linkResourceInstance?.link}" placeholder="Add link"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkResourceInstance, field: 'description', 'error')} required" >
	<label for="description">
		<g:message code="linkResource.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" required="" value="${linkResourceInstance?.description}" placeholder="Add Link Description..."/>

</div>






