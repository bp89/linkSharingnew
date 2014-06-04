package linksharing.resource

import com.linksharing.SeriousnessLevel
import linksharing.User
import linksharing.UserSubscriptionDetails
import linksharing.UtilityService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class TopicController {
    UtilityService utilityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def subscribeToTopic(){


    }

    def updateSeriousnessLevel(){

        String seriousnessLevel = params.seriousnessLevel;
        println "---------"+seriousnessLevel
        Topic topic =  Topic.get(Long.parseLong(params.topicId));

        User user = utilityService.getCurrentUser();

        UserSubscriptionDetails usd = UserSubscriptionDetails.createCriteria().get {
            eq('user',user)
            eq('topic',topic)
        }
        if(usd == null ){
            render "Not Subscribed"
        }else{
            String query = " update UserSubscriptionDetails usd set seriousnessLevel=:seriousnessLevel where usd.user.id=:id and usd.topic.id=:topicID";
            Topic.executeUpdate(query,[seriousnessLevel:seriousnessLevel,id:user.id,topicID:topic.id])
            render 'done'
        }
    }


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List list =   Topic.createCriteria().list {
            'eq'('visibility','Public')
        }
        respond list, model:[topicInstanceCount: Topic.count()]
    }

    def publicTopic(Integer max){
        params.max = Math.min(max ?: 10, 100)
        List list =   Topic.createCriteria().list {
            'eq'('visibility','Public')
        }
        respond list, model:[topicInstanceCount: Topic.count()],view: '_public'
    }

    def privateTopic(Integer max){
        params.max = Math.min(max ?: 10, 100)
        String userID = session.getAttribute("userID");
       /* List list =   Topic.createCriteria().list {
            'eq'('visibility','Private')
            'join'('usersubscriptiondetails')

            'eq'('usersubscriptiondetails.user.id',Long.parseLong(userID))
        }*/
        List list = null;
        if(utilityService.isValidString(userID)){
               String query = "select t from Topic t join t.userSubscriptionDetails usd where usd.user.id=:userID and t.visibility='Private'";
              list = Topic.executeQuery(query,[userID:Long.parseLong(userID)])
        }
        respond list, model:[topicInstanceCount: Topic.count()],view: '_private'
    }

    def show(Topic topicInstance) {
        respond topicInstance
    }

    def create() {
        respond new Topic(params)
    }

    @Transactional
    def save(Topic topicInstance) {

        println "=============visibility================="+visibility
        UserSubscriptionDetails userSubscriptionDetails = new UserSubscriptionDetails();
        // topicInstance.properties=params
        String userID = session.getAttribute('userID')
        User user = User.get(Long.parseLong(userID))
        userSubscriptionDetails.comments = 'Owner of the topic';
        userSubscriptionDetails.user=user;
        userSubscriptionDetails.seriousnessLevel=SeriousnessLevel.MEDIUM.ordinal();
        userSubscriptionDetails.subscribedOn=new Date();
        topicInstance.addToUserSubscriptionDetails(userSubscriptionDetails)
        println "valdation is------------------"+topicInstance.validate()
        println "eroor is-------------"+topicInstance.errors.allErrors;
        topicInstance.save(flush: true)
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            println topicInstance.errors
            respond topicInstance.errors, view:'create'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.name])
                redirect topicInstance
            }
            '*' { respond topicInstance, [status: CREATED] }
        }
    }

    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'edit'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.name])
                redirect topicInstance
            }
            '*'{ respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
