<!DOCTYPE html>
<html>
<head>
    %{--<meta name="layout" content="main"/>--}%
    <title>Welcome to Grails</title>
    <g:javascript library="jquery" plugin="jquery"/>
    <style type="text/css" media="screen">
    html {
        background-color: #ddd;
        background-image: -moz-linear-gradient(center top, #aaa, #ddd);
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #aaa), color-stop(1, #ddd));
        background-image: linear-gradient(top, #aaa, #ddd);
        filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#aaaaaa', EndColorStr = '#dddddd');
        background-repeat: no-repeat;
        height: 100%;
        /* change the box model to exclude the padding from the calculation of 100% height (IE8+) */
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    body {
        background-color: #cca;
        background-image: -moz-linear-gradient(center top, #aaa, #ddd);
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #aaa), color-stop(1, #ddd));
        background-image: linear-gradient(top, #aaa, #ddd);
        color: #333333;
        margin: 180px 420px;
        max-width: 400px;
        height: 300px;
        overflow-x: hidden; /* prevents box-shadow causing a horizontal scrollbar in firefox when viewport < 960px wide */
        -moz-box-shadow: 0 0 0.3em #ccc;;
        -webkit-box-shadow: 0 0 0.3em #ccc;;
        box-shadow: 0 0 0.3em #ccc;;
        -moz-border-radius: 0.3em;
        -webkit-border-radius: 0.3em;
        border-radius: 0.3em;
    }

    .loginFields{
        width: 370px;
        height: 30px;

    }
    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
        padding-bottom: 1em;
        padding-left: .6em;
    }

    #status h1 {
        font-family: "Trebuchet MS", Verdana, Geneva, Arial, Helvetica, sans-serif;
        font-stretch: expanded;
        font-size: 1.1em;
        margin: 0.2em 0 0.3em;
        text-align: center;
        text-transform: full-width;

    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }


    }

    button.g-button, input.g-button[type="submit"] {
        height: 30px;
        line-height: 40px;
        vertical-align: bottom;
        margin: 0px;
    }

    .g-button-submit:focus, .g-button-share:focus, .g-button-red:focus {
        box-shadow: 0px 0px 0px 1px rgb(255, 255, 255) inset;
    }
    .g-button-submit {
        border: 1px solid rgb(48, 121, 237);
        color: rgb(255, 255, 255);
        text-shadow: 0px 1px rgba(0, 0, 0, 0.1);
        background-color: rgb(77, 144, 254);
        background-image: -moz-linear-gradient(center top , rgb(77, 144, 254), rgb(71, 135, 237));
        height: 30px;
    }
    label{
        font-family: "monospace", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;

    }
        #logout{
            font-family: "Trebuchet MS", Verdana, Geneva, Arial, Helvetica, sans-serif;
            font-size: medium;
            color:#0000cc;
        }
    </style>
</head>
<body>

<span id="logout">${flash.logoutMessage}</span>

<div id="status" role="complementary">
    <h1>Welcome to Link Sharing</h1>
    <g:form controller="user" action="login" method="post">
        <ul>
            <li>
                <g:radio name="loginWith" value="uName" id="uName" checked="checked"/><label for="uName">User Name</label>
                <g:radio name="loginWith" value="mailID" id="mailID"/><label for="mailID">Email Id</label>
            </li>
            <li>
                <g:textField name="userName" placeholder="User Name" class="loginFields"/>
            </li>
            <li>
                <g:passwordField name="password" placeholder="Password" class="loginFields"/>
            </li>
            <li>
                <g:checkBox name="rememberMe" value="remember"/><label for="rememberMe">Remember Me?</label>
            </li>
            <li>
                <g:link style='text-decoration:no-underline;font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif' controller="user" action="forgotPassword">Forgot Password?</g:link>
            </li>
            <li>
                <g:submitButton name="submit" value="Log in" class="g-button-submit" />
                <g:link class="g-button-submit" controller="user" action="create">New User? Sign Up</g:link>
            </li>
        </ul>
    </g:form>

%{--<ul>
    <li>App version: <g:meta name="app.version"/></li>
    <li>Grails version: <g:meta name="app.grails.version"/></li>
    <li>Groovy version: ${GroovySystem.getVersion()}</li>
    <li>JVM version: ${System.getProperty('java.version')}</li>
    <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
    <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
    <li>Domains: ${grailsApplication.domainClasses.size()}</li>
    <li>Services: ${grailsApplication.serviceClasses.size()}</li>
    <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
</ul>
<h1>Installed Plugins</h1>
<ul>
    <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
        <li>${plugin.name} - ${plugin.version}</li>
    </g:each>
</ul>--}%
</div>
%{--<div id="page-body" role="main">
    <h1>Welcome to Grails</h1>
    <p>Congratulations, you have successfully started your first Grails application! At the moment
       this is the default page, feel free to modify it to either redirect to a controller or display whatever
       content you may choose. Below is a list of controllers that are currently deployed in this application,
       click on each to execute its default action:</p>

    <div id="controller-list" role="navigation">
        <h2>Available Controllers:</h2>
        <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
            </g:each>
        </ul>
    </div>
</div>--}%
<script type="text/javascript">

   // $(document).ready(function(){
        setTimeout(function() {
            document.getElementById('logout').display=none;
        }, 5000);

    //});

</script>
</body>
</html>
