<%@ page import="linksharing.resource.Topic; linksharing.resource.DocumentResource" %>
<g:javascript  plugin="jquery" library="jquery"/>
<link rel="stylesheet" href="../css/colorbox.css" />
<script type="text/javascript" src="../js/jquery.colorbox.js">
    </script>
<style></style>

<div class="fieldcontain ${hasErrors(bean: documentResourceInstance, field: 'topic', 'error')} required">
    <label for="topic">
        <g:message code="documentResource.topic.label" default="Topic" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="topic" name="topic.id" from="${Topic.list().sort({l1,l2 -> l1.name<=>l2.name})}" optionKey="id" optionValue="name" required="" value="${documentResourceInstance?.topic?.id}" class="many-to-one"/>
        <g:link controller="topic" action="create" class="group1" params="[isPopUp: 'true']"><img src="${resource(dir: 'images',file: 'plus-sign-simple.png')}" height="25px" width="25px" title="Add New Topic"/></g:link>
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

    <input type="file" name="file" required="" value="${documentResourceInstance?.fileName}"  class="upload" style="background-color: #transparent;color: transparent;width: 132px;font-family: "monospace", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif"/>${documentResourceInstance?.fileName}
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




%{--<script>
    $("#upfile").click(function () {
        $("#file").trigger('click');
    });
</script>--}%
<script>
			$(document).ready(function(){
				$(".group1").colorbox({rel:'group1'});
            });
            $("#click").click(function(){
                $('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
                return false;
            });
</script>

