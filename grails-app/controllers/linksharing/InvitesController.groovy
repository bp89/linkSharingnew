package linksharing

import com.linksharing.InviteCO

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class InvitesController {
    UtilityService utilityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def sent(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond  Invites.list(params), model:[invitesInstanceCount: Invites.count()], view:'index'
    }


    def received(Integer max) {
        User user = utilityService.getCurrentUser()
        params.max = Math.min(max ?: 10, 100)

       List invites =  Invites.createCriteria().list{
            'eq'('sentTo',user)
        }
        respond invites, model:[invitesInstanceCount: Invites.count()]
    }


    def sendInvites(){
        println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+request.siteUrl

        List userMailList = User.createCriteria().list {
        }

        println "=====================userMailList=================="+userMailList

        render view: 'sendInvites',model: ['userMailList':userMailList]
    }

    def invite(InviteCO inviteCO){

        if(inviteCO.hasErrors()){
            respond inviteCO.errors, view:'sendInvites'
            return
        }

        String []mailIds = inviteCO.sendInvite.split(",")
        String userID = session.getAttribute('userID')
        utilityService.sendInvites(mailIds,userID,inviteCO.topicId,inviteCO.sendMail)

        request.setAttribute('message',"Invites has been sent successfully.")
        render view:'successPage'
    }

    def show(Invites invitesInstance) {
        respond invitesInstance
    }

    def create() {
        respond new Invites(params)
    }

    def save(Invites invitesInstance) {
        if (invitesInstance == null) {
            notFound()
            return
        }

        if (invitesInstance.hasErrors()) {
            respond invitesInstance.errors, view:'create'
            return
        }

        invitesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'invites.label', default: 'Invites'), invitesInstance.id])
                redirect invitesInstance
            }
            '*' { respond invitesInstance, [status: CREATED] }
        }
    }

    def edit(Invites invitesInstance) {
        respond invitesInstance
    }

    def update(Invites invitesInstance) {
        if (invitesInstance == null) {
            notFound()
            return
        }

        if (invitesInstance.hasErrors()) {
            respond invitesInstance.errors, view:'edit'
            return
        }

        invitesInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Invites.label', default: 'Invites'), invitesInstance.id])
                redirect invitesInstance
            }
            '*'{ respond invitesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Invites invitesInstance) {

        if (invitesInstance == null) {
            notFound()
            return
        }

        invitesInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Invites.label', default: 'Invites'), invitesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'invites.label', default: 'Invites'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
