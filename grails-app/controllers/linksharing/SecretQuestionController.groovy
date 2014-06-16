package linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SecretQuestionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecretQuestion.list(params), model:[secretQuestionInstanceCount: SecretQuestion.count()]
    }

    def show(SecretQuestion secretQuestionInstance) {
        respond secretQuestionInstance
    }

    def create() {
        respond new SecretQuestion(params)
    }

    @Transactional
    def save(SecretQuestion secretQuestionInstance) {
        if (secretQuestionInstance == null) {
            notFound()
            return
        }

        if (secretQuestionInstance.hasErrors()) {
            respond secretQuestionInstance.errors, view:'create'
            return
        }

        secretQuestionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secretQuestion.label', default: 'SecretQuestion'), secretQuestionInstance.id])
                redirect secretQuestionInstance
            }
            '*' { respond secretQuestionInstance, [status: CREATED] }
        }
    }

    def edit(SecretQuestion secretQuestionInstance) {
        respond secretQuestionInstance
    }

    @Transactional
    def update(SecretQuestion secretQuestionInstance) {
        if (secretQuestionInstance == null) {
            notFound()
            return
        }

        if (secretQuestionInstance.hasErrors()) {
            respond secretQuestionInstance.errors, view:'edit'
            return
        }

        secretQuestionInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SecretQuestion.label', default: 'SecretQuestion'), secretQuestionInstance.id])
                redirect secretQuestionInstance
            }
            '*'{ respond secretQuestionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SecretQuestion secretQuestionInstance) {

        if (secretQuestionInstance == null) {
            notFound()
            return
        }

        secretQuestionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SecretQuestion.label', default: 'SecretQuestion'), secretQuestionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secretQuestion.label', default: 'SecretQuestion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
