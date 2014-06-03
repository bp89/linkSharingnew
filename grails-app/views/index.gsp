<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="${resource(dir: 'css',file: 'bootstrap.css')}" rel="stylesheet">
    <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    <!-- CSS code from Bootply.com editor -->
    <style type="text/css">
    .modal-footer {   border-top: 0px; }
    </style>
    <g:javascript library="application"/>
    <r:require module="jquery"/>
    <r:require module="jquery-validate"/>
    <r:layoutResources />
</head>

<!-- HTML code from Bootply.com editor -->

<body  >

<!--login modal-->
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                %{--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>--}%
                <span class="pull-right"> <img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails" height="60px"/></span>
                <span class="pull-left"> <img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails" height="60px"/></span>
                <h1 class="text-center">Link Share Login</h1>
            </div>

            <div class="container">
                <span style="font-size: smaller;color: #116644">${flash.logoutMessage}</span>
                <span style="font-size: smaller;color: #116644">${flash.invalidLogin}</span>
                <div class="row">
                    <div class="span4">

                        <g:hasErrors bean="${loginCOInstance}">
                            <g:eachError bean="${loginCOInstance}" var="error">
                                <div class="alert">
                                    <a class="close" data-dismiss="alert">×</a>
                                    <strong>Error!</strong> <g:message error="${error}"/>
                                </div>

                            </g:eachError>
                        </g:hasErrors>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <g:form controller="user" action="login" method="post" class="form col-md-12 center-block">
                    <g:if test="${loginCOInstance?.loginWith == 'emailID'}">
                        <g:radio name="loginWith" value="uName" id="uName"  onchange="updateField('userName')"/><label for="uName">User Name</label>
                        <g:radio name="loginWith" value="emailID" id="mailID" checked="checked" onchange="updateField('emailID')"/><label for="mailID" required="">Email Id</label>
                    </g:if>
                    <g:else>
                        <g:radio name="loginWith" value="uName" id="uName"  checked="checked" onchange="updateField('userName')"/><label for="uName">User Name</label>
                        <g:radio name="loginWith" value="emailID" id="mailID"  onchange="updateField('emailID')"/><label for="mailID" required="">Email Id</label>
                    </g:else>
                    <div class="form-group">
                        <g:textField name="userName" id="userName" placeholder="User Name" class="form-control input-lg" title="Please enter User Name." required=""/>
                    </div>
                    <div class="form-group">
                        <g:passwordField name="password"  id="password"  placeholder="Password" class="form-control input-lg" title="Please enter Password." />
                    </div>
                    <div class="form-group">
                        <g:checkBox name="rememberMe" value="remember"/><label for="rememberMe">Remember Me?</label>
                    </div>
                    <div class="form-group">
                        <g:submitButton name="submit" value="Sign In" class="btn btn-primary btn-lg btn-block" />

                        <span class="pull-right">
                            <g:link controller="user" action="create">New User? Sign Up</g:link>
                        </span>
                        <span><a href="#">Need help?</a></span>%{--Need to access Forgot Password Links--}%
                    </div>
                </g:form>
            </div>
            <div class="modal-footer">
                %{--<div class="col-md-12">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>--}%
            </div>
        </div>
    </div>
</div>
<g:javascript  plugin="jquery"/>
<g:javascript plugin="jquery-validation-ui"/>
<script type='text/javascript' src="${resource(dir: 'js',file: 'bootstrap.min.js')}"></script>
<script type='text/javascript' src="${resource(dir: 'js',file: 'bootstrap-alert.js')}"></script>
<script>
    $(document).ready(function(){
        updateField('${loginCOInstance?.loginWith}');
    });
    function updateField(field){
        if(field == 'uName'){
            field = 'userName';
        }
        if(field == 'emailID'){
            $('#userName').attr('id',field);
            $('#'+field).attr('name',field);
            $('#'+field).attr('title','Please enter Email ID.');
            $('#'+field).attr('placeholder','Email ID');
            $('#'+field).val('${loginCOInstance?.emailID}');

        }else{
            $('#emailID').attr('id',field);
            $('#'+field).attr('name',field);
            $('#'+field).attr('title','Please enter User Name.');
            $('#'+field).attr('placeholder','User Name');
            $('#'+field).val('${loginCOInstance?.userName}');
        }
    }
</script>
</body>
</html>
