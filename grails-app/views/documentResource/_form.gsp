<%@ page import="linksharing.resource.DocumentResource" %>




<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'topic', 'error')} required">
    <label for="topic">
        <g:message code="documentResource.topic.label" default="Topic" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="topic" name="topic.id" from="${linksharing.resource.Topic.list()}" optionKey="id" required="" value="${documentResourceInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="documentResource.title.label" default="Title" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" required="" value="${documentResourceInstance?.title}" placeholder="e.g. Grails Tutorial"/>

</div>


<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'file', 'error')} required">
    <label for="file">
        <g:message code="documentResource.fileType.label" default="File Type" />
        <span class="required-indicator">*</span>
    </label>
    <input type="file" name="file" required="" value="${documentResourceInstance?.fileType}"/>
</div>


%{--
<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'fileName', 'error')} required">
	<label for="fileName">
		<g:message code="documentResource.fileName.label" default="File Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileName" required="" value="${documentResourceInstance?.fileName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'fileType', 'error')} required">
	<label for="fileType">
		<g:message code="documentResource.fileType.label" default="File Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileType" required="" value="${documentResourceInstance?.fileType}"/>

</div>
--}%
    <div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="documentResource.description.label" default="Description" />
        <span class="required-indicator">*</span>
    </label>
    <g:textArea placeholder="Please describe the document..." name="description" required="" value="${documentResourceInstance?.description}"/>

</div>

