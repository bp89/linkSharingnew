<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 29/5/14
  Time: 10:18 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title>LinkSharing | Administration</title>
    <g:javascript library="jquery" plugin="jquery"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'tabs.css')}" type="text/css">
</head>

<body>

<div class="tabs">
    <ul class="tab-links" style="margin-bottom: 0px;">
        <li class="active"><a href="#tab1">User Settings</a></li>
        <li><a href="#tab2">User Settings</a></li>
        <li><a href="#tab3">Tab #3</a></li>
        <li><a href="#tab4">Tab #4</a></li>
    </ul>

    <div class="tab-content">
        <div id="tab1" class="tab active">
            <g:render template="/user/userSettings"/>
        </div>

        <div id="tab2" class="tab">
            <p>Tab #2 content goes here!</p>
            <p>Donec pulvinar neque sed semper lacinia. Curabitur lacinia ullamcorper nibh; quis imperdiet velit eleifend ac. Donec blandit mauris eget aliquet lacinia! Donec pulvinar massa interdum risus ornare mollis. In hac habitasse platea dictumst. Ut euismod tempus hendrerit. Morbi ut adipiscing nisi. Etiam rutrum sodales gravida! Aliquam tellus orci, iaculis vel.</p>
        </div>

        <div id="tab3" class="tab">
            <p>Tab #3 content goes here!</p>
            <p>Donec pulvinar neque sed semper lacinia. Curabitur lacinia ullamcorper nibh; quis imperdiet velit eleifend ac. Donec blandit mauris eget aliquet lacinia! Donec pulvinar massa interdum ri.</p>
        </div>

        <div id="tab4" class="tab">
            <p>Tab #4 content goes here!</p>
            <p>Donec pulvinar neque sed semper lacinia. Curabitur lacinia ullamcorper nibh; quis imperdiet velit eleifend ac. Donec blandit mauris eget aliquet lacinia! Donec pulvinar massa interdum risus ornare mollis. In hac habitasse platea dictumst. Ut euismod tempus hendrerit. Morbi ut adipiscing nisi. Etiam rutrum sodales gravida! Aliquam tellus orci, iaculis vel.</p>
        </div>
    </div>
</div>


<script>
    $(document).ready(function() {
        $('.tabs .tab-links a').on('click', function(e)  {
            var currentAttrValue = $(this).attr('href');

            // Show/Hide Tabs
            $('.tabs ' + currentAttrValue).show().siblings().hide();

            // Change/remove current tab to active
            $(this).parent('li').addClass('active').siblings().removeClass('active');

            e.preventDefault();
        });
    });
</script>
</body>
</html>