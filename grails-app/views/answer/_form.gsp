<%@ page import="linksharing.resource.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'answer', 'error')} required">
	<label for="answer">
		<g:message code="answer.answer.label" default="Answer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="answer" required="" value="${answerInstance?.answer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="answer.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${linksharing.resource.Question.list()}" optionKey="id" required="" value="${answerInstance?.question?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="answer.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${linksharing.User.list()}" optionKey="id" required="" value="${answerInstance?.user?.id}" class="many-to-one"/>

</div>

