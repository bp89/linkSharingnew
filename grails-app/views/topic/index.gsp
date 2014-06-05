
<%@ page import="linksharing.resource.Topic" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'topic.label', default: 'Topic')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <g:javascript library="jquery" plugin="jquery"/>
</head>
<body>

<h1>
    <span class="button">
        <g:link controller="topic" action="create">Add New Topic</g:link>
    </span>
</h1>
<div class="bs-example">
    <ul class="nav nav-tabs" data-tabs="tabs">
        <li class="active" id="hash1"><a href="javascript:getTopicData('public','hash1');">Public</a></li>
        <li id="hash2"><a href="javascript:getTopicData('private','hash2');">Private</a></li>
    </ul>
</div>

<div id="my-tab-content" class="tab-content">
    <div class="tab-pane active bodyDiv" id="tabForContent">
        <g:render template="/topic/public"/>
    </div>
</div>


<script>

    function getTopicData(type,id){
        var urlPublic =  '${createLink(controller:'topic',action:'publicTopic')}';
        var urlPrivate =  '${createLink(controller:'topic',action:'privateTopic')}';

        $.ajax({
            type: 'POST',
            url: (type == 'private'?urlPrivate:urlPublic),
            data: {
                'type':type
            },
            success: function(data) {
                // $(this).parent('li').addClass('active')
                document.getElementById('tabForContent').innerHTML = data
                $('[id^=hash]').removeClass('active');
                $('#'+id).addClass('active');
            },
            error: function() {

                return false;
            }});
    }


    function setSeriousness(seriousness,whichTopic){
        var url1 = '${createLink(controller:'topic',action:'updateSeriousnessLevel')}'
        var lastSelection = 0;
        $('img[name^=serious'+whichTopic+']').each(function(){
            if( $(this).attr('src') =='${resource(dir: "images",file: "star_PNG1594.png")}')
                lastSelection++;
        });
        $.ajax({
            type: 'POST',
            url: url1,
            data: {
                topicId:whichTopic,
                seriousnessLevel:(lastSelection == (seriousness ) && seriousness=='1'?'0':seriousness)
            },
            success: function(data) {
                if(data=="done"){
                    var currentSelected= 'serious'+whichTopic+'_'+seriousness;

                    $('img[name^=serious'+whichTopic+']').each(function(){

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
