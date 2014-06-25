<%
    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService = grailsApplication.mainContext.getBean("springSecurityService");
    def utilityService = grailsApplication.mainContext.getBean("utilityService");
%>
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
    %{--<r:require module="grayscale"/>--}%
    <r:layoutResources />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
</head>
<body>
<div class="navbar-inverse navbar-default navbar-fixed-top" role="navigation">
    <div class="navbar-header">
        <b><a class="navbar-brand" href="#">Link Sharing</a></b>
    </div>
    <p class="navbar-text">Signed in as <span style="text-transform:capitalize;color: #e5f55e">${springSecurityService.getCurrentUser()?.firstName +" "+ springSecurityService.getCurrentUser()?.lastName}</span></p>
    <div class="container">

        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><g:link class="home" controller="user" action="dashboard"><img height="20px" width="20px" src="${resource(dir: 'images',file: 'home-icon.png')}" title="Dashboard"/></g:link></li>
                <li><g:link class="list" controller="topic" action="index">Topics</g:link></li>

                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Resources <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><g:link class="list" controller="documentResource" action="index">Documents</g:link></li>
                        <li><g:link class="list" controller="linkResource" action="index">Links</g:link></li>
                        <li><g:link class="list" controller="question" action="index">Questions</g:link></li>
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img height="25px" width="25px" src="${resource(dir: 'images',file: 'Settings-icon.png')}" title="Settings"/>Settings<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header"><img height="15px" width="15px" src="${resource(dir: 'images',file: 'securitySetting.png')}"/>&nbsp;Administration</li>
                        <li><g:link class="list" controller="user" action="administration"><img height="15px" width="15px" src="${resource(dir: 'images',file: 'user-settings-icon.png')}"/>&nbsp;User Settings</g:link></li>
                        <li><g:link class="list" controller="invites" action="sent"><img height="15px" width="15px" src="${resource(dir: 'images',file: 'color_settings.png')}"/>&nbsp;Change Options</g:link></li>
                        <li><g:link class="list" controller="invites" action="sent"><img height="15px" width="15px" src="${resource(dir: 'images',file: 'options.png')}"/>&nbsp;Change Theme</g:link></li>
                        <li class="divider"></li>
                        <li class="dropdown-header"> Configuration</li>
                        <li><a href="#"><img height="15px" width="15px" src="${resource(dir: 'images',file: 'home-icon.png')}"/> Home</a></li>
                        <li><a href="#">Pending</a></li>
                    </ul>

                </li>
                <sec:ifLoggedIn>
                    <li><g:link  controller="logout" type="POST">Logout</g:link></li>
                </sec:ifLoggedIn>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>

<section class="intro">
    <div class="container" style="padding-top: 30px;">
        <div class="row">
            <div class="col-md-12" >
            <span class="styleSelect" style="float:right;border-bottom: 1px groove;width: 100%;">
                <span>Admin > Change Password</span>
                <g:select style="float:right" id="userID" name="userID" from="${utilityService.getAllUsersByRole('ROLE_USER').sort({l1,l2 -> l1.name <=> l2.name})}" optionKey="id" optionValue="name" required="" value="-1" />
            </span>
        </div>
    </div>
</div>
</section>

<section>
    <div class="container">
        <div class="row">
            <div class="col-md-12 ${(actionName =='index' && controllerName == 'topic')?'':'bodyDiv'} container-fluid" id="mainDivImp">
                <g:layoutBody/>
            </div>
        </div>
    </div>
</section>



<g:render template="/templates/footer"/>
<r:layoutResources />
</body>
</html>
