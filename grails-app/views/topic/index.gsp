
<%@ page import="linksharing.resource.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div id="list-topic" class="content scaffold-list" role="main">
    <h1>
        <g:message code="default.list.label" args="[entityName]" />
        <span class="button">
            <g:link controller="topic" action="create">Add New Topic</g:link>
        </span>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table style="table-layout: fixed">
        <thead>
        <tr>
            <g:sortableColumn property="name" title="${message(code: 'topic.name.label', default: 'Name')}" />
            <g:sortableColumn property="description" title="${message(code: 'topic.description.label', default: 'Description')}" />
            <g:sortableColumn property="visibility" title="${message(code: 'topic.visibility.label', default: 'Visibility')}" />
            <th><g:message code="documentResource.action.label" default="Actions" /></th>
            <th>Seriousness</th>
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
                    <td style="word-wrap: break-word;width: 25%;text-overflow: ellipsis ;overflow: hidden" ><g:link style="word-wrap: normal" action="show" id="${topicInstance.id}">${fieldValue(bean: topicInstance, field: "description")}</g:link></td>
                    <td>${fieldValue(bean: topicInstance, field: "visibility")}</td>
                    <td>
                        <g:link class="actions" controller="topic" action="show" params="['id':topicInstance.id]">
                            <img src="${resource(dir: "images",file: "view-512.png")}" height="20px" width="20px" title="View"/>
                        </g:link>
                        <g:link class="actions" controller="topic" action="edit" params="['id':topicInstance.id]">
                            <img src="${resource(dir: "images",file: "pencil1.png")}" height="20px" width="20px" title="Edit"/>
                        </g:link>
                        <g:link  class="actions" controller="topic" action="delete" params="['id':topicInstance.id]">
                            <img src="${resource(dir: "images",file: "-trash.png")}" height="20px" width="20px" title="Delete"/>
                        </g:link>
                        <g:link class="actions" controller="invites" action="sendInvites" params="['id':topicInstance.id]">
                            <img src="${resource(dir: "images",file: "invites.png")}" height="20px" width="20px" title="Send Invites"/>
                        </g:link>
                    </td>
                    <td>


                        <img src="${resource(dir: "images",file: "1211769487.png")}" height="22px" width="22px" title="Very Low" name="serious${topicInstance.id}_1" onclick="javascript:setSeriousness('1',${topicInstance.id})"/>
                        <img src="${resource(dir: "images",file: "1211769487.png")}" height="22px" width="22px" title="Low" name="serious${topicInstance.id}_2" onclick="javascript:setSeriousness('2',${topicInstance.id})"/>
                        <img src="${resource(dir: "images",file: "1211769487.png")}" height="22px" width="22px" title="Medium" name="serious${topicInstance.id}_3" onclick="javascript:setSeriousness('3',${topicInstance.id})"/>
                        <img src="${resource(dir: "images",file: "1211769487.png")}" height="22px" width="22px" title="High" name="serious${topicInstance.id}_4" onclick="javascript:setSeriousness('4',${topicInstance.id})"/>
                        <img src="${resource(dir: "images",file: "1211769487.png")}" height="22px" width="22px" title="Extreme" name="serious${topicInstance.id}_5" onclick="javascript:setSeriousness('5',${topicInstance.id})"/>


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


<script type="text/javascript">

    function setSeriousness(seriousness,whichTopic){
        var url1 = '${createLink(controller:'topic',action:'updateSeriousnessLevel')}'

        $.ajax({
            type: 'POST',
            url: url1,
            data: {
                topicId:whichTopic,
                seriousnessLevel:seriousness
            },
            success: function(data) {
                if(data=="done"){
                    var currentSelected= 'serious'+whichTopic+'_'+seriousness;
                    var lastSelection = 0;
                    $('img[name^=serious'+whichTopic+']').each(function(){
                        if( $(this).attr('src') =='${resource(dir: "images",file: "star_PNG1594.png")}')
                            lastSelection++;

                        if($(this).attr('name').split('_')[1] <= seriousness ){
                            $(this).attr('src','${resource(dir: "images",file: "star_PNG1594.png")}')
                        }else{
                            $(this).attr('src','${resource(dir: "images",file: "1211769487.png")}')
                        }
                    });
                    if(lastSelection == (seriousness ) &&  $('img[name='+currentSelected+']').attr('src') == '${resource(dir: "images",file: "star_PNG1594.png")}'){
                        $('img[name='+currentSelected+']').attr('src','${resource(dir: "images",file: "1211769487.png")}')
                    }else if(seriousness ==1){
                        $('img[name='+currentSelected+']').attr('src','${resource(dir: "images",file: "star_PNG1594.png")}')
                    }
                }else{
                    alert('You are not subscribed to this topic.');
                }
            },
            error: function() {

                return false;
            }});
    }
</script>
</body>
</html>
