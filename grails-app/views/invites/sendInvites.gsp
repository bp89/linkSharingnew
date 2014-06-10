<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 26/5/14
  Time: 3:03 PM
--%>

<%@ page import="linksharing.resource.Topic" contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main">
    <r:require module="select2"/>
    %{--<r:require module="multiselectFilter"/>--}%
</head>
<body>
<table class="note">
    <tr>
        <td>
            <b>Note:</b>
        </td>
    </tr>
    <tr>
        <td>
            <ul >
                <li>
                    <h5>Select topics that you want to send invites to.</h5>
                </li>
                <li>
                    <h5>Choose Email IDs that you want to invite.</h5>
                </li>
                <li>
                    <h5>Select <b>Send Mail</b> if you want to send mail to selected Email IDs.</h5>
                </li>
            </ul>

        </td>
    </tr>
</table>


<div class="container">
    <span style="font-size: smaller;color: #116644">${flash.logoutMessage}</span>
    <span style="font-size: smaller;color: #116644">${flash.invalidLogin}</span>
    <div class="row">
        <div class="span4">

            <g:hasErrors bean="${inviteCOInstance}">
                <g:eachError bean="${inviteCOInstance}" var="error">
                    <div class="alert">
                        <a class="close" data-dismiss="alert">×</a>
                        <strong>Error!</strong> <g:message error="${error}"/>
                    </div>

                </g:eachError>
            </g:hasErrors>
        </div>
    </div>
</div>

<g:form  action="invite" >
    <fieldset class="form">
        <div class="fieldcontain  ${hasErrors(bean: userInstance, field: 'streetAddress', 'error')} required">
            <label for="sendInvite">Topic</label>
            <g:select class="chosen-select" style="width:400px;" data-placeholder="Select Your Options" id="topic" name="topicId" from="${Topic.list().sort({l1,l2 -> l1.name<=>l2.name})}" optionKey="id" optionValue="name" required="" value="${inviteCOInstance?.topicId}" multiple="5"/>
        </div>

        <div class="fieldcontain  ${hasErrors(bean: userInstance, field: 'streetAddress', 'error')} required">
            <label for="sendInvite">Send Invites</label>
            <g:select name="sendInvite" from="${userMailList}" optionValue="emailID" optionKey="emailID" required="" placeholder="Select Email Ids." id="mySel2" class="select2" multiple="multiple" style="width:800px;" value="${inviteCOInstance?.emailID}"/>
        </div>

        <div class="fieldcontain  ${hasErrors(bean: userInstance, field: 'streetAddress', 'error')} required">
            <label for="sendInvite">Send Email?</label>
            <g:checkBox name="sendMail" value="yes" />
        </div>

    </fieldset>
    <fieldset class="button" style="float: left">
        <g:submitButton name="send" class="save" value="${message(code: 'default.button.send.label', default: 'Send')}" />
    </fieldset>
</g:form>
<r:script>
    $(document).ready(function (){
        $("#mySel2").select2({
            closeOnSelect:false
        });

        /*$(".chosen-select").multiselect({
            includeSelectAllOption: true
        }).multiselectfilter({


        });*/
    });
</r:script>
</body>
</html>