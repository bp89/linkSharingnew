package linksharing.resource

import grails.transaction.Transactional
import linksharing.User
import linksharing.UtilityService
import org.hibernate.criterion.CriteriaSpecification

import javax.management.Query
import javax.persistence.criteria.JoinType

import static org.springframework.http.HttpStatus.*

class DocumentResourceController {
    UtilityService utilityService
    def  mailService
    //def grailsApplication


    def markAsReadUnread(){
        String userID = session.getAttribute('userID');
        println "====userID====="+userID
        String  resourceID = params.id;

        ResourceSettings resourceSettings = ResourceSettings.createCriteria().get {
            //eq("user.id",Long.parseLong(userID))
            eq("user.id",Long.parseLong("1"))
            eq("resource.id",Long.parseLong(resourceID))
        }

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
        User currentUser = utilityService.getCurrentUser()
        println "==========currentUser.id============="+currentUser.id
        List<DocumentResource> listOfResources= DocumentResource.createCriteria().list {
            if(utilityService.isValidString(params.topicId)){
                eq("topic.id",Long.parseLong(params.topicId))
            }else{
                createAlias('topic', 't', CriteriaSpecification.INNER_JOIN)
                createAlias('t.userSubscriptionDetails', 'usd', CriteriaSpecification.LEFT_JOIN)
                'or'{
                    'eq'('usd.user.id',currentUser.id)
                    if(! currentUser.isAdmin == '1'){
                        'eq'('user.id',currentUser.id)
                    }
                }

            }
        }
        respond listOfResources, model:[documentResourceInstanceCount: DocumentResource.count()]
    }

    def show(DocumentResource documentResourceInstance) {
        respond documentResourceInstance
    }

    def create() {
        User user = utilityService.getCurrentUser()

        List topics = Topic.createCriteria().list {
            createAlias('userSubscriptionDetails','usd',CriteriaSpecification.INNER_JOIN)
            'eq'('usd.user.id',user.id)
        }

        request.setAttribute('topics',topics)
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

        User user = utilityService.getCurrentUser()
        user.addToResources(documentResourceInstance)

        documentResourceInstance.properties=params

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
                redirect action:"confirmation", method:"GET",params: ['fromWhere':'documentDelete']
            }
            '*'{ render status: NO_CONTENT }
        }
    }


    def confirmation(){
        String fromWhere = params.fromWhere;
        String message = "";
        if(fromWhere  == 'documentDelete'){
            message = "Document has been deleted successfully."
        }else{
            message = "Confirmation not configured."
        }

        render view: 'confirmation',model :['message' : message]
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
