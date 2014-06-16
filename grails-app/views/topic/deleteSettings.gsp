<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 9/6/14
  Time: 12:06 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link href="${resource(dir: 'css',file: 'bootstrap.css')}" rel="stylesheet">
</head>
<body>
<g:form controller="topic" action="delete" onsubmit="return validate();" id="deleteForm">
    <div class="bodyDiv">
        <h2>Delete Topic "Topic name"</h2>
        <hr>
        <div >
            <g:checkBox name="sendMail" value="yes" id="sendMail" checked=""/><label for="sendMail">Send alert Mail to Subscribed Users.</label>
        </div>
        <div>
            <g:checkBox name="preserveOwners" value="yes" id="preserveOwners" checked="" onchange="javascript:togglePreserve(this)"/><label for="preserveOwners">Preserve data of other resource owners.</label>
            <g:textField name="preserveTime" id="preserveTime" value="" placeholder="Preserve Time" style="width:150px" disabled="disabled"/>
        </div>

    </div>
    <div class="button" style="float: left;">
        <g:submitButton name="submit"/>
    </div>
    <g:hiddenField name="topicId" value="${params.id}"/>
</g:form>
<script type='text/javascript' src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>

<script>
    function togglePreserve(ele){
        if(ele.checked){
            document.getElementById('preserveTime').disabled = false;
        }else{
            document.getElementById('preserveTime').disabled = true;
        }
    }


    function validate(){
        var form = document.getElementById('deleteForm')
        if(isNaN(form.preserveTime.value)){
            alert('Please enter correct Preserve Time.');
            return false;
        }else{
            return true;
        }
    }
</script>
</body>
</html>