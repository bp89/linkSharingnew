package linksharing

import com.linksharing.ForgotPasswordCO
import grails.plugin.mail.MailService
import grails.transaction.Transactional
import linksharing.resource.Topic
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.codehaus.groovy.grails.web.util.WebUtils
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class UtilityService {
    def grailsApplication
    MailService mailService

    def serviceMethod() {

    }

    /**
     *
     * @param string
     * @return
     */
    Boolean isValidString(String string){
        string==null  || string == 'null' || string.trim() =='' ?false:true;
    }

    /**
     *
     * @param params
     * @param fileBytes
     * @return
     */
    Boolean uploadFile(GrailsParameterMap params,def fileBytes){
        int size = 0;
        println ">>>>>>>>>>>>>>>>>>>>>>"+params.topic
        String buildDocs = grailsApplication.config.builddocs
        CommonsMultipartFile uploadedFile = params.file
        String contentType =  "";
        String fileName = "";
        if(uploadedFile){
            contentType =  uploadedFile.contentType
            fileName = uploadedFile.originalFilename
//           size = uploadedFile.size
            params.fileType = contentType
            params.fileName = fileName
        }
        println "============="+buildDocs+params.topic.id+"/"+ fileName
        if (!fileBytes?.empty ) {
            try{
                File file = new File(buildDocs+params.topic.id+"/"+ fileName)
                file.mkdirs()
                fileBytes.transferTo(file)
            }catch (Exception e){
                println "Exception while uploading file"
                return false;
            }
            return true
        }

    }

    /**
     *
     * @param mailIds
     * @param sentBy
     * @param topicIds
     */
    void sendInvites(String []mailIds,String sentBy,def topicIds,def sendMail){
        def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
        User user = null;
        if(isValidString(sentBy)){
            user = User.get(Long.parseLong(sentBy))
        }else{
            user = User.get(1) //Default admin
        }
        String subject = "You are invited to join Topic"
        List<Invites> invitesList = new ArrayList<Invites>();
        Topic topic = Topic.get(Long.parseLong(topicIds))
        Invites invite = null;
        //  StringBuilder html = getInvitationHTML(topicIds);
        def criteria = User.createCriteria()


        def listResults = criteria.list() {
            'in'('emailID',mailIds)
        }

        //Map results = listResults.collect { usr -> [emailID: usr.emailID, userID: usr.id] }
        println "=========listResults goes here==========="+listResults
        Map results =[:]

        listResults.each {user1 ->
            results.put(user1.emailID, user1)
        }
        //Map results = listResults.collect{itr.inject([:]) {results, col -> results << [(col.emailID): col.id]}}

        println "=========results goes here==========="+results
        StringBuilder html = null
        for(String mailID:mailIds){

            html  = new StringBuilder(g.render(template: '/templates/sendInvitesTemplate',model:['user':results.get(mailID),'topic':topic,'sender':user]))

            invite = new Invites();
            invite.mailID=mailID;
            invite.sentBy = user;
            invite.sentTo = results.get(mailID);
            invite.sentOn = new  Date();
            invite.mailID = mailID;
            invite.topic = topic
            invite.save(flush: true)
            if(isValidString(sendMail) && sendMail=='yes'){
                this.sendMail(user.emailID, Arrays.asList(mailIds),null,null,subject,html.toString(),true)
            }
        }


    }

    /**
     *
     * @param sender
     * @param sendTo
     * @param mailCC
     * @param mailBcc
     * @param mailSubject
     * @param textOrHTML
     * @param isHTML
     * @return
     */
    def sendMail(String sender,List<String> sendTo,List<String> mailCC,List<String> mailBcc,String mailSubject,String textOrHTML,boolean isHTML){
        mailService.sendMail {
            from sender
            to sendTo
            subject mailSubject
            //cc mailCC
//            bcc mailBcc
            if(isHTML){
                html  textOrHTML
            }else{
                text "this is some text"
            }
        }

    }
    /**
     *
     * @param topicID
     * @return
     */
    StringBuilder getInvitationHTML(String topicID){
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        Topic topic = Topic.get(Long.parseLong(topicID))
        def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
        StringBuilder html= new StringBuilder();
        html.append("<html>")
                .append("<body>")
                .append("<a href='").append(webUtils.getCurrentRequest().siteUrl).append("' >Subscribe to ").append(topic.name).append("</a>")
                .append("</body")
                .append("</html>")
        return html
    }

    /**
     *
     * @param user
     * @param randomNumber
     * @return
     */
    StringBuilder getForgotPasswordHTML(User user,String randomNumber){
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        String siteUrl = webUtils.getCurrentRequest().siteUrl
        StringBuilder html= new StringBuilder();
        html.append("<html>")
                .append("<body>")
                .append("To reset your password follow steps mentioned below:")
                .append("<ol>")
                .append("<li>")
                .append("<a href='").append(siteUrl).append("/user/resetPassword?confirmCode=").append(randomNumber).append("'>Click here to Reset your password ").append("</a>.")
                .append("</li>")
                .append("<li>")
                .append("Enter your new Password.")
                .append("</li>")
                .append("<li>")
                .append("Enter Confirmation password.")
                .append("</li>")
                .append("<li>")
                .append("You are done.Try logging in with new details.")
                .append("</li>")
                .append("</ol>")
                .append("</body")
                .append("</html>")
        return html

    }

    /**
     *
     * @param emailID
     * @return
     */
    User getUserOnEmailID(String emailID){
        return  User.createCriteria().get {
            eq("emailID",emailID)
        }
    }

    /**
     *
     * @param user
     * @param forgotPasswordCO
     * @param confirmCode
     * @return
     */
    def triggerForgotPasswordMail(User user,ForgotPasswordCO forgotPasswordCO,String confirmCode){
        String subject = "Reset your password now."
        sendMail('support@intelligrape.com', [forgotPasswordCO.emailID],null,null,subject,getForgotPasswordHTML(user,confirmCode).toString(),true)
    }

    /**
     *
     * @return
     */
    def getCurrentUser(){
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        String userID= webUtils.getCurrentRequest().getSession().getAttribute("userID");
        if(isValidString(userID)){
            return User.get(Long.parseLong(userID));
        }else{
            return null;
        }
    }

    /**
     *
     * @param ordinal
     * @return
     */
    public String getString(String ordinal){
        return getString(Integer.parseInt(ordinal));
    }
    /**
     *
     * @param ordinal
     * @return
     */
    public String getString(Integer ordinal){
        switch (ordinal){
            case 1: return "Very Low"
                break;
            case 2 : return "Low"
                break;
            case 3: return "Medium"
                break;
            case 4:return "High"
                break;
            default :return "Extreme"
                break;
        }
    }

    /**
     *
     * @param userID
     * @return
     */
    def getSubscribedToTopics(Long userID){
        return  UserSubscriptionDetails.createCriteria().list {
            projections{
                property('topic.id')
                property('seriousnessLevel','seriousnessLevel')
            }
            'eq'('user.id',userID)
        }
    }

    /**
     *
     * @param userID
     * @return
     */
    def getSubscribedToTopics(String userID){
        return getSubscribedToTopics(Long.parseLong(userID))

    }

    /**
     *
     * @return
     */
    def getPublicTopics(){
        return Topic.createCriteria().list {
            'eq'('visibility','Public')
        }
    }
    /**
     *
     */
    def fillPublicTopicDetails(){
        def webUtils = WebUtils.retrieveGrailsWebRequest()
        def request = webUtils.getCurrentRequest()
        User user = getCurrentUser()
        List tempList =   getSubscribedToTopics(user.id)
        List subscribedTo = []
        Map <String,String> seriousnessLevel = [:];

        tempList.each {
            seriousnessLevel.put(it[0],it[1]);
            subscribedTo.add(it[0])
        }
        request.setAttribute('subscribedTo',subscribedTo)
        request.setAttribute('seriousnessLevel',seriousnessLevel)
    }
}
