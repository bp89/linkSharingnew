
<%@ page import="com.linksharing.SeriousnessLevel; linksharing.resource.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

</head>
<body>
<%
    def utilityService = grailsApplication.mainContext.getBean("utilityService");
%>
<div id="list-topic" class="content scaffold-list" role="main">
    <h1>
        <g:message code="default.list.label" args="[entityName]" />
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table style="table-layout: fixed">
        <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'topic.name.label', default: 'Name')}" />
            <g:sortableColumn property="description" title="${message(code: 'topic.description.label', default: 'Description')}" />
            %{--<g:sortableColumn property="visibility" title="${message(code: 'topic.visibility.label', default: 'Visibility')}" />--}%
            <th>Seriousness</th>
            <th><g:message code="documentResource.action.label" default="Actions" /></th>
        </tr>
        </thead>
        <tbody>
        <tbody>
        <g:if test="${topicInstanceList == null || topicInstanceList.size() == 0}">
            <tr>
                <td colspan="4">No records found.</td>
            </tr>
        </g:if>
        <g:else>
            <g:each in="${topicInstanceList}" status="i" var="topicInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${fieldValue(bean: topicInstance, field: "name")}</td>
                    <td style="word-wrap: break-word;width: 25%;text-overflow: ellipsis ;overflow: hidden" ><g:link style="word-wrap: normal" action="show" id="${topicInstance.id}" class="group1">${fieldValue(bean: topicInstance, field: "description")}</g:link></td>
                    %{-- <td>${fieldValue(bean: topicInstance, field: "visibility")}</td>--}%
                    <td>
                        <%
                            //String seriousnessLevel = topicInstance.userSubscriptionDetails[0]?.seriousnessLevel;
                            String seriousnessLevel = request.seriousnessLevel.get(topicInstance.id);
                            int j=Integer.parseInt(utilityService.isValidString(seriousnessLevel)?seriousnessLevel:'0')
                            for(int m=1;m <= 5 ;m++){

                        %>
                        <img src="${resource(dir: "images",file: "${(j-->0?'star_PNG1594.png':'1211769487.png')}")}" height="22px" width="22px" title="Very Low" name="serious${topicInstance.id}_${m}" onclick="javascript:setSeriousness('${m}',${topicInstance.id})"/>
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <g:link class="actions" controller="topic" action="show" params="['id':topicInstance.id]">
                            <img src="${resource(dir: "images",file: "view-512.png")}" height="20px" width="20px" title="View"/>
                        </g:link>
                        <g:if test="${topicInstance.owner.id == utilityService.getCurrentUser().id}">
                            <g:link class="actions" controller="topic" action="edit" params="['id':topicInstance.id]">
                                <img src="${resource(dir: "images",file: "pencil1.png")}" height="20px" width="20px" title="Edit"/>
                            </g:link>

                            <g:link  class="actions deleteTopic" controller="topic" action="beforeDelete" params="['id':topicInstance.id]">
                                <img src="${resource(dir: "images",file: "-trash.png")}" height="20px" width="20px" title="Delete"/>
                            </g:link>
                        </g:if>

                        <g:link class="actions" controller="invites" action="sendInvites" params="['id':topicInstance.id]">
                            <img src="${resource(dir: "images",file: "invites.png")}" height="20px" width="20px" title="Send Invites"/>
                        </g:link>
                        <a class="actions" href="javascript:toggleSubscription('${topicInstance.id}')" >
                            %{--<img src="${resource(dir: "images",file: "subscribed.png")}" height="20px" width="20px" title="Send Invites"/>--}%
                            <span style="font-size: medium" id="subscriptionToggle_${topicInstance.id}" title="Subscribe">
                                <g:if test="${request.subscribedTo.contains(topicInstance.id)}">
                                    U
                                </g:if>
                                <g:else>
                                    S
                                </g:else>
                            </span>
                        </a>
                    </td>
                </tr>
            </g:each>
        </g:else>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${topicInstanceCount ?: 0}" />
    </div>
</div>
<r:script>
    function toggleSubscription(topicID){
        var urlToggle =  '${createLink(controller:'topic',action:'toggleSubscription')}';

        $.ajax({
            type: 'POST',
            url: urlToggle,
            data: {
                topicID:topicID
            },
            success: function(data) {
                if(data == 'subscribed'){
                    document.getElementById('subscriptionToggle_'+topicID).innerHTML = 'U'
                }else{
                    document.getElementById('subscriptionToggle_'+topicID).innerHTML = 'S'
                }
            },
            error: function() {

                return false;
            }});

    }

    $(document).ready(function(){
     $(".deleteTopic").colorbox({iframe:true,width:'700px',height:'370px'});
     });



    /*function deleteTopic(topicID){


        $(".group1").colorbox({rel:'group1',iframe:true, innerWidth:480, innerHeight:390});

        var decision = confirm('Are you sure you want to delete this topic.');

        if(decision){

        }else{

        }
    }*/
</r:script>
</body>
</html>
