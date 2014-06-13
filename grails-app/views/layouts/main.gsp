<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Link Share"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link href="${resource(dir: 'css',file: 'bootstrap.css')}" rel="stylesheet">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <g:layoutHead/>
    <g:javascript library="application"/>
    <r:require module="bootstrap"/>
    <r:layoutResources />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>
<body>
<%
    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService = grailsApplication.mainContext.getBean("springSecurityService");
    def utilityService = grailsApplication.mainContext.getBean("utilityService");
%>
<div class="navbar-inverse navbar-default navbar-fixed-top" role="navigation">
    <div class="navbar-header">
        <b><a class="navbar-brand" href="#">Link Sharing</a></b>
    </div>
    <p class="navbar-text">Signed in as <span style="text-transform:capitalize;color: #e5f55e">${springSecurityService.getCurrentUser()?.firstName +" "+ springSecurityService.getCurrentUser()?.lastName}</span></p>
    <div class="container">

        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><g:link class="home" controller="user" action="dashboard"><g:message code="default.home.label"/></g:link></li>
                <li><g:link class="list" controller="topic" action="index">Topics</g:link></li>

                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Resources <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><g:link class="list" controller="documentResource" action="index">Documents</g:link></li>
                        <li><g:link class="list" controller="linkResource" action="index">Links</g:link></li>
                    </ul>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Invites <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><g:link class="list" controller="invites" action="sent">Invites Sent</g:link></li>
                        <li><g:link class="list" controller="invites" action="received">Invites Received</g:link></li>
                        %{--<li class="divider"></li>--}%
                        %{--<li class="dropdown-header">Nav header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>--}%
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <div class="input-group">
                        <input type="text" class="input-large search-query " name="searchText" placeholder="Search..."" value="" style="height:33px;margin-top: 8px">

                    </div>
                </li>
                <li><g:link  controller="user" action="administration">Administration</g:link></li>
                <sec:ifLoggedIn>
                    <li><g:link  controller="logout" type="POST">Logout</g:link></li>
                </sec:ifLoggedIn>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>

<div class="${(actionName =='index' && controllerName == 'topic')?'':'bodyDiv'} container-fluid" id="mainDivImp">
    <g:layoutBody />
</div>



<div class="socialMedia">
    <a class="fbhead" href="https://www.facebook.com/pages/SoftIVenture/267927196554975?ref=hl" target="_blank"></a>
    <a class="tweethead" href="http://twitter.com/softiventure" target="_blank"></a>
    <a class="linkedhead" href="http://www.linkedin.com/profile/view?id=127104334&amp;trk=nav_responsive_tab_profile_pic" target="_blank"></a>
    <a class="googleHead" href="http://www.linkedin.com/profile/view?id=127104334&amp;trk=nav_responsive_tab_profile_pic" target="_blank"></a>
</div>

<div class="footer" role="contentinfo" style="text-align: center">
    <hr>
    <div>All rights reserved &copy;2003-2013 .&VerticalLine; An Intelligrape proprietry.<br/>Informatics Patent</div>
</div >
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />
</body>
</html>
