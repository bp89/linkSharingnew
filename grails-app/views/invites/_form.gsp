<%@ page import="linksharing.Invites" %>



<div class="fieldcontain ${hasErrors(bean: invitesInstance, field: 'acceptedOn', 'error')} required">
	<label for="acceptedOn">
		<g:message code="invites.acceptedOn.label" default="Accepted On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="acceptedOn" precision="day"  value="${invitesInstance?.acceptedOn}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: invitesInstance, field: 'sentBy', 'error')} required">
	<label for="sentBy">
		<g:message code="invites.sentBy.label" default="Sent By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sentBy" name="sentBy.id" from="${linksharing.User.list()}" optionKey="id" required="" value="${invitesInstance?.sentBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: invitesInstance, field: 'sentOn', 'error')} required">
	<label for="sentOn">
		<g:message code="invites.sentOn.label" default="Sent On" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="sentOn" precision="day"  value="${invitesInstance?.sentOn}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: invitesInstance, field: 'sentTo', 'error')} required">
	<label for="sentTo">
		<g:message code="invites.sentTo.label" default="Sent To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sentTo" name="sentTo.id" from="${linksharing.User.list()}" optionKey="id" required="" value="${invitesInstance?.sentTo?.id}" class="many-to-one"/>

</div>

