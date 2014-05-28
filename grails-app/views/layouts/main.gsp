<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <g:javascript plugin="jquery" ></g:javascript>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <r:require module="jquery-ui"/>
    <jqui:resources theme="darkness" />
    <r:layoutResources />
</head>
<body>
<div id="grailsLogo" role="banner"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails" height="70px"/><span style="text-transform: full-width;font-weight:bolder;font-family: "monospace",  sans-serif;">Link Sharing</span>
%{-- <div class="socialMedia">
    <a class="fbhead" href="https://www.facebook.com/pages/SoftIVenture/267927196554975?ref=hl" target="_blank"></a>
    <a class="tweethead" href="http://twitter.com/softiventure" target="_blank"></a>
    <a class="linkedhead" href="http://www.linkedin.com/profile/view?id=127104334&amp;trk=nav_responsive_tab_profile_pic" target="_blank"></a>
    <a class="googleHead" href="http://www.linkedin.com/profile/view?id=127104334&amp;trk=nav_responsive_tab_profile_pic" target="_blank"></a>
</div>--}%
    <g:if test="${flash.skipLogout != 'skip'}">
        <span style="float:right;">
            <g:link class="list" controller="user" action="logout">
                Logout
            </g:link>
        </span>
    </g:if>
    <div class="nav" role="navigation" >
        <ul>
            <li><g:link class="home" controller="user" action="dashboard"><g:message code="default.home.label"/></g:link></li>
            <li><g:link class="list" controller="topic" action="index">Topics</g:link></li>
            <li><g:link class="list" controller="documentResource" action="index">Documents</g:link></li>
            <li><g:link class="list" controller="linkResource" action="index">Links</g:link></li>
            <li><g:link class="list" controller="invites" action="sent">Invites Sent</g:link></li>
            <li><g:link class="list" controller="invites" action="received">Invites Received</g:link></li>
        </ul>
    </div>
</div>
<g:layoutBody/>


<div style="background-color: #b7a2ff;height: 42px;">

</div>
<div class="socialMedia">
    <a class="fbhead" href="https://www.facebook.com/pages/SoftIVenture/267927196554975?ref=hl" target="_blank"></a>
    <a class="tweethead" href="http://twitter.com/softiventure" target="_blank"></a>
    <a class="linkedhead" href="http://www.linkedin.com/profile/view?id=127104334&amp;trk=nav_responsive_tab_profile_pic" target="_blank"></a>
    <a class="googleHead" href="http://www.linkedin.com/profile/view?id=127104334&amp;trk=nav_responsive_tab_profile_pic" target="_blank"></a>
</div>
<div class="footer" role="contentinfo" style="text-align: center">

    <div>All rights reserved &copy;2003-2013 .&VerticalLine; An Intelligrape proprietry.<br/>Informatics Patent</div>
</div >
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />
</body>
</html>
