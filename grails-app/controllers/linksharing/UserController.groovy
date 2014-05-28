package linksharing

import grails.plugin.mail.MailService
import grails.plugin.simplecaptcha.SimpleCaptchaService
import grails.transaction.Transactional
import linksharing.resource.Resource
import linksharing.resource.Topic

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class UserController {
    def SimpleCaptchaService simpleCaptchaService;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def mailService
    def utilityService

    def forgotPassword(){
/*

        String emailId = params.emailID;
        User user = User.createCriteria().get {
            eq("emailID",emailId)
        }
        String confirmCode= user.lastName+user.lastName +UUID.randomUUID().toString()


        */
/*mailService.sendMail {
            from "banti.prajapati@intelligrape.com"
            to "banti.prajapati89@gmail.com"
            subject "Hello"
            body "This is a test"
        }*//*



        utilityService.sendMail('banti.prajapati@intelligrape.com',new String [emailId],null,null,utilityService.getForgotPasswordHTML(user,confirmCode),true)
*/
        render (view:"forgotPassword");
    }


    def invalidLogin(){

        render (view:"invalidLogin")
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def dashboard(){
        String userID = session.getAttribute("userID")

        List subscribedTopics = Topic.createCriteria().list {
            eq("owner.id",Long.parseLong(userID));
        }

        request.setAttribute("subscribedTopics",subscribedTopics)

        List unreadItems = Resource.createCriteria().list {

            //eq("resourceSettings.readStatus",'unread')
            //eq("topic.userSubscriptionDetails.user.id",Long.parseLong(userID))

        }

        request.setAttribute("unreadItems",unreadItems)


        List top15Topics = Topic.createCriteria().list(max: 15) {

            eq("visibility",'public')
            //eq("resourceSettings.readStatus",'unread')
            //eq("topic.userSubscriptionDetails.user.id",Long.parseLong(userID))

        }
        request.setAttribute("top15Topics",top15Topics)

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
        redirect(uri: "")
        //redirect "/index.gsp"
    }

    def login(){
        User user = User.createCriteria().get(){
            eq("userName",params.userName)
            eq("password",params.password)
        }

        if(user){
            session.setAttribute("userID",user.id);
            //setting session to expiry in 30 mins
            session.setMaxInactiveInterval(30*60);

            /*Cookie loginCookie = new Cookie("user",user);
            //setting cookie to expiry in 30 mins
            loginCookie.setMaxAge(30*60);
            response.addCookie(loginCookie);
            response.addCookie(loginCookie);
            */
            render (view: "dashboard")
        }else{
            render (view: "loginFailure")
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

    /* @Transactional
     def delete(User userInstance) {

         if (userInstance == null) {
             notFound()
             return
         }

         userInstance.delete flush:true

         request.withFormat {
             form multipartForm {
                 flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                 redirect action:"index", method:"GET"
             }
             '*'{ render status: NO_CONTENT }
         }
     }*/

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    def resetPassword(){
        println "Random number is :"+params.confirmCode
    }
}
