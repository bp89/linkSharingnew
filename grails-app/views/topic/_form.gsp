<%@ page import="linksharing.resource.Topic" %>
<style type="text/css">
.visibility{
    list-style-type: none;
}
.visibility  li{
    float: left;
    display: inline;
    position: relative;
    margin-left: 10px;
}
.visibility   label{
    float: right;
    margin-left: 10px;
}
</style>
<%
    def utilityService = grailsApplication.mainContext.getBean("utilityService");
%>
<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="topic.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${topicInstance?.name}" placeholder="Name of Topic"/>
</div>


<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="topic.description.label" default="Description" />
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="description" required="" value="${topicInstance?.description}" placeholder="Enter description of topic..."/>
</div>


%{--
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
--}%


<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'visibility', 'error')} required">
    <label for="visibility">
        <g:message code="topic.visibility.label" default="Visibility" />
        <span class="required-indicator">*</span>
    </label>
    <ul class="visibility" >
        <g:if test="{topicInstance?.visibility == 'Public'}">
            <li>
                <g:radio id="public" name="visibility" value="Public" checked="checked" /> <label for="public">Public</label>
            </li>

            <li>
                <g:radio id="private" name="visibility" value="Private" /> <label for="private">Private</label>
            </li>
        </g:if>
        <g:else>

            <li>
                <g:radio id="public" name="visibility" value="Public" /> <label for="public">Public</label>
            </li>

            <li>
                <g:radio id="private" name="visibility" value="Private" checked="checked" /> <label for="private">Private</label>
            </li>

        </g:else>



    </ul>
</div>
<g:hiddenField name="owner.id" value="${utilityService.getCurrentUser().id}"/>
%{--<g:hiddenField name="userSubscriptionDetails.comments" value="Topic Owner"/>
<g:hiddenField name="userSubscriptionDetails.seriousnessLevel" value="NA"/>

<g:hiddenField name="userSubscriptionDetails.user.id" value="1"/>--}%


