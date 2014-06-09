
<%@ page import="linksharing.resource.DocumentResource" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

<div id="list-documentResource" class="content scaffold-list" role="main">
    <h1>
        <g:message code="default.list.label" args="['Document']" />
        <span class="button">
            <g:link controller="documentResource" action="create"><span class="glyphicon glyphicon-plus"></span>Add Document</g:link>
        </span>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        %{--<col width="50px" />
        <col width="30px" />
        <col width="40px" />
        <col width="40px" />
        <col width="40px" />
        <col width="40px" />--}%
        <thead>
        <tr>
            <g:sortableColumn property="title" title="${message(code: 'documentResource.title.label', default: 'Title')}" />
            <g:sortableColumn property="fileName" title="${message(code: 'documentResource.fileName.label', default: 'Document Name')}" />
            <g:sortableColumn property="fileType" title="${message(code: 'documentResource.fileType.label', default: 'Document Type')}" />
            <g:sortableColumn property="description" title="${message(code: 'documentResource.description.label', default: 'Description')}" />
            <th><g:message code="documentResource.topic.label" default="Topic" /></th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <g:if test="${documentResourceInstanceList ==null || documentResourceInstanceList.size() == 0}">
            <tr>
                <td colspan="6">No records found.</td>
            </tr>
        </g:if>
        <g:else>
            <g:each in="${documentResourceInstanceList}" status="i" var="documentResourceInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${fieldValue(bean: documentResourceInstance, field: "title")}</td>
                    <td>${fieldValue(bean: documentResourceInstance, field: "fileName")}</td>
                    <td>${fieldValue(bean: documentResourceInstance, field: "fileType")}</td>
                    <td><g:link  action="show" id="${documentResourceInstance.id}">${fieldValue(bean: documentResourceInstance, field: "description").toString()}</g:link></td>
                    <td>${fieldValue(bean: documentResourceInstance, field: "topic.name")}</td>
                    <td>
                        <g:link controller="documentResource" action="download" params="['id':documentResourceInstance.topic.id,'fileName':documentResourceInstance.fileName,'fileType':documentResourceInstance.fileType]">
                            <img src="${resource(dir: "images",file: "1396477307_download.png")}" height="20px" width="20px" title="Download"/>
                        </g:link>
                        <g:link controller="documentResource" action="edit" params="['id':documentResourceInstance.id]">
                            <img src="${resource(dir: "images",file: "pencil1.png")}" height="20px" width="20px" title="Edit"/>
                        </g:link>
                        <g:link controller="documentResource" action="delete" params="['id':documentResourceInstance.id]">
                            <img src="${resource(dir: "images",file: "-trash.png")}" height="20px" width="20px" title="Delete"/>
                        </g:link>

                        <a  href="javascript:markAsReadUnread(${documentResourceInstance.id})">
                            <img id="contentRead${documentResourceInstance.id}" src="${resource(dir: "images",file: (documentResourceInstance.resourceSettings.readStatus.contains('unread')? "unread.png":"read.png"))}" height="20px" width="20px" title="Mark as Read"/>
                        </a>

                    </td>
                </tr>
            </g:each>
        </g:else>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${documentResourceInstanceCount ?: 0}" />
    </div>
</div>

<script type="text/javascript">

    function markAsReadUnread(documentResourceId){
        var url1 = '${createLink(controller:'documentResource',action:'markAsReadUnread')}'
        $.ajax({
            type: 'POST',
            url: url1,
            data: {
                id:documentResourceId
            },
            success: function(data) {
                if(data=="read"){
                    $('#contentRead'+documentResourceId).attr("src","${resource(dir: "images",file: "read.png")}")
                }else{
                    $('#contentRead'+documentResourceId).attr("src","${resource(dir: "images",file: "unread.png")}")
                }
            },
            error: function() {

                return false;
            }});
    }
</script>
</body>
</html>

