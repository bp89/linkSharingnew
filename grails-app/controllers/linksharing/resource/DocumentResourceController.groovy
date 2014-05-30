package linksharing.resource

import grails.transaction.Transactional
import linksharing.User
import linksharing.UtilityService

import javax.management.Query

import static org.springframework.http.HttpStatus.*

class DocumentResourceController {
    UtilityService utilityService
    def  mailService
    //def grailsApplication
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def markAsReadUnread(){
        String userID = session.getAttribute('userID');
        println "====userID====="+userID
        String  resourceID = params.id;
        // def query = " from ResourceSettings as  rs WHERE  rs.user.id =:userID and rs.resource.id=:resourceID";

        //def resourceSettings = ResourceSettings.executeQuery(query,['userID':1l,'resourceID':Long.parseLong(params.id)])

        ResourceSettings resourceSettings = ResourceSettings.createCriteria().get {
            //eq("user.id",Long.parseLong(userID))
            eq("user.id",Long.parseLong("1"))
            eq("resource.id",Long.parseLong(resourceID))
        }
        println ">>>>>>>>>>"+resourceSettings

        if(resourceSettings== null || resourceSettings.readStatus==null){
            User user = User.get("1");
            Resource resource = Resource.get(resourceID)
            ResourceSettings rs = new ResourceSettings();
            rs.readStatus = 'read'
            user.addToResourceSettings(rs)
            resource.addToResourceSettings(rs)
            rs.save()
            render "read"
        }else{
            if(resourceSettings.readStatus=='read'){
                resourceSettings.readStatus = 'unread';
            }else{
                resourceSettings.readStatus = 'read';
            }
            resourceSettings.save(flush: true)
            render resourceSettings.readStatus
        }
    }

    def index(Integer max) {
        List<DocumentResource> listOfResources= DocumentResource.createCriteria().list {
            if(utilityService.isValidString(params.topicId)){
                eq("topic.id",Long.parseLong(params.topicId))
                groupProperty('')
            }
        }

        respond listOfResources, model:[documentResourceInstanceCount: DocumentResource.count()]
    }

    def show(DocumentResource documentResourceInstance) {
        respond documentResourceInstance
    }

    def create() {
        respond new DocumentResource(params)
    }

    def download() {
        String buildDir = grailsApplication.config.builddocs
        println buildDir+"/" + params.id+"/" + params.fileName;
        File file = new File(buildDir+ params.id+"/" + params.fileName)

        response.setContentType(params.fileType)

        response.setHeader('Content-Disposition', 'Filename='+params.fileName)
        response.outputStream << file.newInputStream()
    }

    def save(DocumentResource documentResourceInstance) {
        if (documentResourceInstance == null) {
            notFound()
            return
        }


        utilityService.uploadFile(params,request.getFile('file'))
        String  userId = session.getAttribute("userID")

        User user =User.get(Long.parseLong(userId))
        user.addToResources(documentResourceInstance)

        documentResourceInstance.properties=params

        println documentResourceInstance.errors;

        if (documentResourceInstance.hasErrors()) {
            respond documentResourceInstance.errors, view:'edit'
            return
        }

        documentResourceInstance.save flush:true


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'documentResource.label', default: 'Document Resource'), documentResourceInstance.id])
                redirect documentResourceInstance
            }
            '*'{ respond documentResourceInstance, [status: CREATED] }

        }

    }

    def edit(DocumentResource documentResourceInstance) {
        respond documentResourceInstance
    }

    def update(DocumentResource documentResourceInstance) {
        if (documentResourceInstance == null) {
            notFound()
            return
        }
        utilityService.uploadFile(params,request.getFile('file'))
        documentResourceInstance.properties=params


        if (documentResourceInstance.hasErrors()) {
            respond documentResourceInstance.errors, view:'edit'
            return
        }

        documentResourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message',args: [message(code: 'documentResource.label', default: 'Document Resource'), documentResourceInstance.id])
                redirect documentResourceInstance
            }
            '*'{ respond documentResourceInstance, [status: OK] }
        }
    }

    def delete(DocumentResource documentResourceInstance) {
        if (documentResourceInstance == null) {
            notFound()
            return
        }
        documentResourceInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message',args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
