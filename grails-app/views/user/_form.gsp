<%@ page import="linksharing.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
    <label for="firstName">
        <g:message code="user.firstName.label" default="First Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="firstName" required="" value="${userInstance?.firstName}" placeholder="First Name"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
    <label for="lastName">
        <g:message code="user.lastName.label" default="Last Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="lastName" required="" value="${userInstance?.lastName}" placeholder="Last Name"/>

</div>
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <label for="username">
        <g:message code="user.username.label" default="User ID" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="password">
        <g:message code="user.password.label" default="Create a Password" />
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
    <label for="passwordConfirm">
        <g:message code="user.password.label" default="Confirm your password" />
        <span class="required-indicator">*</span>
    </label>
    <g:passwordField name="passwordConfirm" required="" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'age', 'error')} required">
    <label for="age">
        <g:message code="user.age.label" default="Age" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="age" type="number" value="${userInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'country', 'error')} required">
    <label for="country">
        <g:message code="user.country.label" default="Country" />
        <span class="required-indicator">*</span>
    </label>
    <g:countrySelect name="country" required="" value="${userInstance?.country}" style="width:250px"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'state', 'error')} required">
    <label for="state">
        <g:message code="user.state.label" default="State" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="state" required="" value="${userInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} required">
    <label for="city">
        <g:message code="user.city.label" default="City" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="city" required="" value="${userInstance?.city}" class="required"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'emailID', 'error')} required">
    <label for="emailID">
        <g:message code="user.emailID.label" default="Email ID" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="emailID" class="required email" required="" value="${userInstance?.emailID}"/>
</div>




<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'streetAddress', 'error')} required">
    <label for="streetAddress">
        <g:message code="user.streetAddress.label" default="Street Address" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="streetAddress" required="" value="${userInstance?.streetAddress}"/>
</div>


<div class="fieldcontain required">
    <label for="captcha">Prove you're not a Robot :</label>
    <img src="${createLink(controller: 'simpleCaptcha', action: 'captcha')}"/><br/>
   <g:textField name="captcha"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
    <g:checkBox name="agree" required="" />
    <label for="agree">I agree to the <g:link >Terms of Service</g:link> and <g:link>Privacy Policy</g:link> of Intelligrape.</label><br/>

</div>