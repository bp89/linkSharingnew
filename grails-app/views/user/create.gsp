<!DOCTYPE html>
<html>
<head>
    %{--    <meta name="layout" content="main">--}%
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript plugin="jquery-validation-ui"/>
    <r:require module="jquery"/>
    <style type="text/css">


    html {
        background-color: #fff8f6;
        background-image: -moz-linear-gradient(center top, #fff8f6, #ddd);
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #fff8f6), color-stop(1, #ddd));
        background-image: linear-gradient(top, #fff8f6, #ddd);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#aaaaaa', EndColorStr = '#dddddd');
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        font-family: Geneva, Arial, Helvetica, sans-serif;

    }

    body {
        background-color: #fffbf9;
        background-image: -moz-linear-gradient(center top, #fffbf9, #def);
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #fffbf9), color-stop(1, #ddd));
        background-image: linear-gradient(top, #fbfbff, #ddd);
        color: #333333;
        width: 900px;
        overflow-x: hidden; /* prevents box-shadow causing a horizontal scrollbar in firefox when viewport < 960px wide */
        -moz-box-shadow: 0 0 0.3em #ccc;;
        -webkit-box-shadow: 0 0 0.3em #ccc;;
        box-shadow: 0 0 0.3em #ccc;;
        -moz-border-radius: 0.3em;
        -webkit-border-radius: 0.3em;
        border-radius: 0.3em;
        margin-left:160px ;
    }
    h1{
        font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
        color: #000000;
        text-align: center;
        text-decoration-color: #97D0E8;
        border-bottom: dashed 1px #97D0E8 ;
        font-size: larger;
        font-weight: bold;
    }


    .content{
        width: 400px;
        border: 1px dotted white;
    }
    .info{
        position: relative;
        float: left;

    }
    .info ul{
        list-style-type: none;
    }
    .info ul img{
        padding-left: 50px;
    }
    </style>
</head>
<body>

<table cellspacing="0" cellpading="0" width="100%" >
    <tr>
        <td>
            <div class="info">
                <ul>

                    <li>
                        <h1 style="font-weight: normal">One account is all you need</h1>

                        <h5 style="font-weight: normal">A single username and password gets you into all the resources available at Link share.</h5>

                        <img src="${resource(dir: 'images', file: 'link.png')}" alt="Link Image"/>
                    </li>
                    <li>
                        <h1 style="font-weight: normal">Share with people you want to</h1>

                        <h5 style="font-weight: normal">Make public and / or private Topics and share only with people you want to share.</h5>

                        <img src="${resource(dir: 'images', file: 'private.png')}" alt="Link Image"/>
                    </li>

                    <li>
                        <h1 style="font-weight: normal">Share from anywhere</h1>

                        <h5 style="font-weight: normal">Access your important documents and links from anywhere in the world.</h5>

                        <img src="${resource(dir: 'images', file: 'global.png')}" alt="Link Image" width="320px" height="200px"/>
                    </li>
                </ul>
            </div>
        </td>
        <td>
            <div id="create-user" class="content scaffold-create" role="main">
                %{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%

                <h1>Create your Account </h1>

                <g:hasErrors bean="${resourceInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${resourceInstance}" var="error">
                            <g:message error="${error}"/>
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <g:hasErrors bean="${userInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${userInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>


                <g:form url="[resource:userInstance, action:'save']"  name="signUpForm" id="signUpForm">
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>

                    <fieldset class="button" style="float: left">
                        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </fieldset>
                </g:form>
            </div>
        </td>
    </tr>
</table>
<r:script type="text/javascript">
    $(document).ready(function(){
        $('#signUpForm').validate({



            rules : {
                'userName': {
                    required: true
                }
            }
        });

    });
    //addClassRules
    /*submit:function(form){
     }
     return false;*/

</r:script>

</body>
</html>
