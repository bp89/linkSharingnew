<%@ page import="linksharing.resource.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="question.answers.label" default="Answers" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.answers?}" var="a">
    <li><g:link controller="answer" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="answer" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'answer.label', default: 'Answer')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="question.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${questionInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="question.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="question" required="" value="${questionInstance?.question}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'resourceSettings', 'error')} ">
	<label for="resourceSettings">
		<g:message code="question.resourceSettings.label" default="Resource Settings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${questionInstance?.resourceSettings?}" var="r">
    <li><g:link controller="resourceSettings" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="resourceSettings" action="create" params="['question.id': questionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resourceSettings.label', default: 'ResourceSettings')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="question.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${questionInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="question.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${linksharing.resource.Topic.list()}" optionKey="id" required="" value="${questionInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'topics', 'error')} ">
	<label for="topics">
		<g:message code="question.topics.label" default="Topics" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="question.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${linksharing.User.list()}" optionKey="id" required="" value="${questionInstance?.user?.id}" class="many-to-one"/>

</div>

