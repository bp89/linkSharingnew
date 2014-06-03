<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 17/5/14
  Time: 5:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<g:javascript plugin="jquery" library="jquery"></g:javascript>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
    <style>
    .dashboard{
        min-height: 400px;
        min-width: 600px;
        background-image: -moz-linear-gradient(center top, #49fff2, #cb9bf4);
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ec73ef), color-stop(1, #ddd));
        background-image: linear-gradient(top, #a23, #e4e5d7);
        -moz-box-shadow: 0.3 0 0.3em #ccc;;
        -webkit-box-shadow: 0 0 0.3em #ccc;;
        box-shadow: 0.3 0.3 0.3em #ccc;;
        -moz-border-radius: 0.8em;
        -webkit-border-radius: 0.3em;
    }
    .section{
        width: 312px;
        min-height: 400px;
        float: left;
        /*border: 1px double #00008B;*/
        margin-left: 5px;

    }
    h1{
        text-align: left;
        margin: 1px;
        color: #111111;
        font-size: medium;
    }
    </style>
</head>

<body>

        <div class="col-md-12 col-sm-12">
            <table>
                <thead>
                <tr><td colspan="2" onclick="toggleMe('topicsSubscribed',this)"><h1>Topics Subscribed   <img src="${resource(dir: 'images',file: 'show.png')}" height="20px" width="20px"  style="float: right"/></h1></td></tr>
                <tbody id="topicsSubscribed" >
                <tr>

                    <th>Topic</th>
                    <th>Description</th>
                </tr>

                </thead>

                <g:if test="${request.subscribedTopics == null || request.subscribedTopics.size == 0 }">
                    <tr class="odd">
                        <td colspan="2">
                            No records found.
                        </td>
                    </tr>
                </g:if>
                <g:else>
                    <g:each in="${request.subscribedTopics}" status="i" var="subscribedTopic">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>${fieldValue(bean: subscribedTopics, field: "name")}</td>
                            <td>${fieldValue(bean: subscribedTopics, field: "description").substring(0,20)}...</td>
                        </tr>
                    </g:each>
                </g:else>
            </tbody>
            </table>
        </div>
        <div class="col-md-12 col-sm-12">
            <table>
                <thead>
                <tr><td colspan="2" onclick="toggleMe('unreadItems',this)"><h1>Unread Items  <img src="${resource(dir: 'images',file: 'hide-512.png')}" height="20px" width="20px"  style="float: right"/></h1></td></tr>
                <tbody id="unreadItems" style="display: none">
                <tr>

                    <th>Title</th>
                    <th>Topic</th>
                </tr>
                </thead>

                <g:if test="${request.subscribedTopics == null || request.subscribedTopics.size == 0 }">
                    <tr class="odd">
                        <td colspan="2">
                            No records found.
                        </td>
                    </tr>
                </g:if>
                <g:else>
                    <g:each in="${request.unreadItems}" status="i" var="unreadItems">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>${fieldValue(bean: unreadItems, field: "title")}</td>
                            <td>${fieldValue(bean: unreadItems, field: "topic.name")}</td>
                        </tr>
                    </g:each>
                </g:else>
            </tbody>
            </table>
        </div>
        <div class="col-md-12 col-sm-12">
            <table>
                <thead>
                <tr><td colspan="2" onclick="toggleMe('top15Topics',this)" style="cursor: hand;"><h1>Top 15 Public Topics <img src="${resource(dir: 'images',file: 'hide-512.png')}" height="20px" width="20px"  style="float: right"/></h1></td></tr>
                <tbody  id="top15Topics" style="display: none">
                <tr>

                    <th>Topic</th>
                    <th>Description</th>
                </tr>
                </thead>

                <g:if test="${request.subscribedTopics == null || request.subscribedTopics.size == 0 }">
                    <tr class="odd">
                        <td colspan="2">
                            No records found.
                        </td>
                    </tr>
                </g:if>
                <g:else>
                    <g:each in="${request.top15Topics}" status="i" var="topic">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>${fieldValue(bean: topic, field: "name")}</td>
                            <td>${fieldValue(bean: topic, field: "description").substring(0,20)}...</td>
                        </tr>
                    </g:each>
                </g:else>
            </tbody>
            </table>
        </div>

<script type="text/javascript">
    function toggleMe(me,ele){

        var showIcon = '${resource(dir:'images',file: 'show.png')}';
        var hideIcon = '${resource(dir:'images',file: 'hide-512.png')}';

        if($('#'+me).css('display')=='none'){
            $('#'+me).show();
            $(ele).find('img').attr("src", showIcon);
        }else{
            $('#'+me).hide();
            $(ele).find('img').attr("src", hideIcon);
        }

    }
</script>
</body>
</html>