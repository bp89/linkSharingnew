package linksharing

import com.linksharing.ForgotPasswordCO
import com.linksharing.LoginCO
import com.linksharing.SecretQuestionCO
import com.linksharing.UpdatePasswordCO
import grails.plugin.mail.MailService
import grails.plugin.simplecaptcha.SimpleCaptchaService
import grails.transaction.Transactional
import linksharing.resource.Resource
import linksharing.resource.Topic
import static org.springframework.http.HttpStatus.*

//@Transactional(readOnly = true)
class UserController {
    def SimpleCaptchaService simpleCaptchaService;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def mailService
    def utilityService

    def forgotPassword(){
        render (view:"forgotPassword");
    }



    def sendResetMail(ForgotPasswordCO forgotPasswordCO){
        if (forgotPasswordCO.hasErrors()  ) {
            respond forgotPasswordCO.errors, view:'forgotPassword'
            return
        }

        User user = utilityService.getUserOnEmailID(forgotPasswordCO.emailID)
        if(forgotPasswordCO.emailID !=''){
            String confirmCode= user.lastName+user.lastName +UUID.randomUUID().toString()
            user.secretKeyToResetPassword = confirmCode
            //user.save(flush: true)
            User.executeUpdate("update User set secretKeyToResetPassword=:confirmCode where id =(:id)", [confirmCode:confirmCode,id: user.id])
            utilityService.triggerForgotPasswordMail(user,forgotPasswordCO,confirmCode)
        }
        render (view:"forgotPassword");
    }

    def invalidLogin(){

        render view:'/index'
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def dashboard(){
        String userID = session.getAttribute("userID")
        if(!utilityService.isValidString(userID)){
            flash.put("invalidLogin","You are not logged in.")
            redirect(controller: 'user',action: 'invalidLogin')
        }else{
            List subscribedTopics =   Topic.executeQuery("select t from Topic t join t.userSubscriptionDetails usd where usd.user.id=:userID",[userID:Long.parseLong(userID)])
            request.setAttribute("subscribedTopics",subscribedTopics)
           /* List unreadItems = Resource.createCriteria().list {
                //eq("resourceSettings.readStatus",'unread')
                //   eq("topic.userSubscriptionDetails.user.id",Long.parseLong(userID))
            }*/
            List unreadItems = Resource.executeQuery("select r from Resource r join r.resourceSettings rs  where rs.readStatus='unread'  and rs.user.id=:userID",[userID:Long.parseLong( userID)])
            request.setAttribute("unreadItems",unreadItems)


            List top15Topics = Topic.createCriteria().list(max: 15) {
                eq("visibility",'public')
            }

            request.setAttribute("top15Topics",top15Topics)

        }
        render (view:"dashboard")
    }


    def topics(){
        render (controllerName:"topic",view:"dashboard")
    }
    def logout(){

        /* Cookie loginCookie = null;
         Cookie[] cookies = request.getCookies();
         if(cookies != null){
             for(Cookie cookie : cookies){
                 if(cookie.getName().equals("user")){
                     loginCookie = cookie;
                     break;
                 }
             }
         }
         if(loginCookie != null){
             loginCookie.setMaxAge(0);
             response.addCookie(loginCookie);
         }*/

        if(session != null){
            session.invalidate();
        }

        flash.put("logoutMessage","You have been logged out successfully.")

        //render (controllerName:"main",view:"index")
        //redirect(uri: "")
        render view: '/index'
        //        redirect "/index.gsp"
    }

    def login(LoginCO loginCO){

        if(loginCO.hasErrors()){
            respond loginCO.errors, view: '/index'
            return
        }else{
            User user = User.createCriteria().get(){
                if(loginCO.loginWith=='uName'){
                    eq("userName",loginCO.userName)
                }else{
                    eq("emailID",loginCO.emailID)
                }
                eq("password",loginCO.password)
            }
            if(user && !loginCO.hasErrors()){
                session.setAttribute("userID",user.id);
                //setting session to expiry in 30 mins
                session.setMaxInactiveInterval(30*60);

                /*Cookie loginCookie = new Cookie("user",user);
                //setting cookie to expiry in 30 mins
                loginCookie.setMaxAge(30*60);
                response.addCookie(loginCookie);
                response.addCookie(loginCookie);*/

                redirect (controller: 'user', action: "dashboard")
            }
        }
    }
    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        // String requestURI = request.forwardURI
        println ">>>>>>>>>>>>>>>>>>>>"+params.passwordConfirm
        flash.put("skipLogout",'skip');
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }


        println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" +userInstance.errors

        boolean captchaValid = simpleCaptchaService.validateCaptcha(params.captcha)
        if (userInstance.hasErrors() || !captchaValid ) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }






    def resetPassword(){
        String secretKeyToResetPassword = params.confirmCode

        User user = User.createCriteria().get {
            eq('secretKeyToResetPassword',secretKeyToResetPassword);
        }
        request.setAttribute('secretKeyToResetPassword',secretKeyToResetPassword)
        request.setAttribute('userID',user.id)
        if(user!=null && user.secretKeyToResetPassword.equals(secretKeyToResetPassword)  ){
            render view: 'resetPassword'
        }else{

            render view: 'error'
        }
    }


    def updatePassword(UpdatePasswordCO updatePasswordCO){
        String userID = params.userID;


        if(updatePasswordCO.hasErrors()){
            flash.put('errorInPassword','Password does not match')
            respond updatePasswordCO.errors,view:'resetPassword'
        }else{
            User user = User.get(updatePasswordCO.userID);
            user.password = params.password;

            render "Password has been changed successfully."
        }



    }

    def configureSecretQuestion(SecretQuestionCO secretQuestionCO){
        User user =utilityService.getCurrentUser()
        secretQuestionCO.answer= user.answer
        secretQuestionCO.secretQuestion=user.secretQuestion
        params.put('secretQuestionCO',secretQuestionCO)
        render view: 'configureSecretQuestion'
    }


    def administration(){
        render view: 'administration'
    }

    def submitSecretQuestion(SecretQuestionCO secretQuestionCO){
        int count = User.executeUpdate("update User  set answer=:answer,  secretQuestion=:question where id=:id",[answer:secretQuestionCO.answer,question:secretQuestionCO.secretQuestion,id:utilityService.getCurrentUser().id])
        if(count == 1){
            println "Hurray!Secret Question has been set."
        }
        params.put('secretQuestionCO',secretQuestionCO)
        respond secretQuestionCO,view:'secretQuestion'
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
