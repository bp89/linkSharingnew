<%--
  Created by IntelliJ IDEA.
  User: prajapati
  Date: 17/5/14
  Time: 5:29 PM
--%>

<%@ page import="linksharing.resource.LinkResource; linksharing.resource.DocumentResource" contentType="text/html;charset=UTF-8" %>
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
                <tr><td colspan="3" onclick="toggleMe('topicsSubscribed',this)" onmouseover="javascript:$(this).css('cursor', 'pointer');"><h1>Topics Subscribed   <img src="${resource(dir: 'images',file: 'show.png')}" height="20px" width="20px"  style="float: right"/></h1></td></tr>
                <tbody id="topicsSubscribed" >
                <tr>

                    <th>Topic</th>
                    <th>Description</th>
                    <th>Resource(s)</th>
                </tr>

                </thead>

                <g:if test="${request.subscribedTopics == null || request.subscribedTopics.size() == 0 }">
                    <tr class="odd">
                        <td colspan="3">
                            No records found.
                        </td>
                    </tr>
                </g:if>
                <g:else>
                    <g:each in="${request.subscribedTopics}" status="i" var="subscribedTopic">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td nowrap>${fieldValue(bean: subscribedTopic, field: "name")}</td>
                            <td>${fieldValue(bean: subscribedTopic, field: "description")}</td>
                            <td nowrap>
                                <span class="property-value" aria-labelledby="visibility-label" >
                                    <g:link title="Document Resources " controller="documentResource" action="index" params="['topicId':subscribedTopic.id]">
                                        ${subscribedTopic?.findResources(DocumentResource)}
                                    </g:link>
                                    Document(s)
                                </span>

                                <span class="property-value" aria-labelledby="visibility-label">
                                    <g:link title="Link Resources " controller="linkResource" action="index" params="['topicId':subscribedTopic.id]" >
                                        ${subscribedTopic?.findResources(LinkResource)}
                                    </g:link>
                                    Link(s)
                                </span>
                            </td>
                        </tr>
                    </g:each>
                </g:else>
            </tbody>
            </table>
        </div>


        <div class="col-md-12 col-sm-12">
            <table>
                <thead>
                <tr><td colspan="4" onclick="toggleMe('unreadItems',this)" onmouseover="javascript:$(this).css('cursor', 'pointer');"><h1>Unread Items  <img src="${resource(dir: 'images',file: 'hide-512.png')}" height="20px" width="20px"  style="float: right"/></h1></td></tr>
                <tbody id="unreadItems" style="display: none">
                <tr>

                    <th >Title</th>
                    <th>Topic</th>
                    <th>Type</th>
                    <th>Description</th>
                </tr>
                </thead>

                <g:if test="${request.unreadItems == null || request.unreadItems.size() == 0 }">
                    <tr class="odd">
                        <td colspan="4">
                            No records found.
                        </td>
                    </tr>
                </g:if>
                <g:else>
                    <g:each in="${request.unreadItems}" status="i" var="unreadItem">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td nowrap >${fieldValue(bean: unreadItem, field: "title")}</td>
                            <td nowrap>${fieldValue(bean: unreadItem, field: "topic.name")}</td>
                            <td nowrap>${unreadItem instanceof  linksharing.resource.LinkResource ?'Link':'Document'}</td>
                            <td>${unreadItem.description}</td>
                        </tr>
                    </g:each>
                </g:else>
            </tbody>
            </table>
        </div>



        <div class="col-md-12 col-sm-12">
            <table>
                <thead>
                <tr><td colspan="3" onclick="toggleMe('top15Topics',this)" onmouseover="javascript:$(this).css('cursor', 'pointer');"><h1>Top 15 Public Topics <img src="${resource(dir: 'images',file: 'hide-512.png')}" height="20px" width="20px"  style="float: right"/></h1></td></tr>
                <tbody  id="top15Topics" style="display: none">
                <tr>

                    <th>Topic</th>
                    <th>Description</th>
                    <th>Resource(s)</th>
                </tr>
                </thead>

                <g:if test="${request.top15Topics == null || request.top15Topics.size() == 0 }">
                    <tr class="odd">
                        <td colspan="3">
                            No records found.
                        </td>
                    </tr>
                </g:if>
                <g:else>
                    <g:each in="${request.top15Topics}" status="i" var="topic">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td>${fieldValue(bean: topic, field: "name")}</td>
                            <td>${fieldValue(bean: topic, field: "description").substring(0,20)}...</td>
                            <td>
                                <span class="property-value" aria-labelledby="visibility-label" >
                                    <g:link title="Document Resources " controller="documentResource" action="index" params="['topicId':topic.id]">
                                        ${topic?.findResources(DocumentResource)}
                                    </g:link>
                                    Document(s)
                                </span>

                                <span class="property-value" aria-labelledby="visibility-label">
                                    <g:link title="Link Resources " controller="linkResource" action="index" params="['topicId':topic.id]" >
                                        ${topic?.findResources(LinkResource)}
                                    </g:link>
                                    Link(s)
                                </span>
                            </td>
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