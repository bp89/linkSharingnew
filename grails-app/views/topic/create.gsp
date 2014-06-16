<!DOCTYPE html>
<html>
<head>
    <g:if test="${params.isPopUp != 'true'}">
        <meta name="layout" content="main">
    </g:if>
    <g:else>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'mainPopUp.css')}" type="text/css">
    </g:else>
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="../css/colorbox.css" />
</head>
<body>

<div id="create-topic mainDivImp" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${topicInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${topicInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:topicInstance, action:'save']" >
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="button" style="float: left">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</div>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.colorbox.js"></script>

<script>
    $(document).ready(function(){
        parent.$.colorbox.resize({width:'800px',height:'570px'})
    });
</script>
</body>
</html>

