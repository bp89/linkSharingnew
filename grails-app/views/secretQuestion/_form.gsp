<%@ page import="linksharing.SecretQuestion" %>



<div class="fieldcontain ${hasErrors(bean: secretQuestionInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="secretQuestion.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="question" required="" value="${secretQuestionInstance?.question}" style="width:600px"/>

</div>

