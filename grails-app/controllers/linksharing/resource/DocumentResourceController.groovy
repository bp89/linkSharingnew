package linksharing.resource



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentResourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DocumentResource.list(params), model:[documentResourceInstanceCount: DocumentResource.count()]
    }

    def show(DocumentResource documentResourceInstance) {
        respond documentResourceInstance
    }

    def create() {
        respond new DocumentResource(params)
    }

    @Transactional
    def save(DocumentResource documentResourceInstance) {
        if (documentResourceInstance == null) {
            notFound()
            return
        }
        println ">>>>>>>>>>>>>>>>>>.."+ params.file
        def mhsr = request.getFile('file')
        if (!mhsr?.empty ) {
            mhsr.transferTo(
                    new File("/home/prajapati/Desktop/project/builddocs/ddfds")
            )
        }
        //println params.file.name
       // params.file
/*

        if (documentResourceInstance.hasErrors()) {
            respond documentResourceInstance.errors, view:'create'
            return
        }
*/

        documentResourceInstance.save flush:true

        request.withFormat {
        /*    form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
                redirect documentResourceInstance
            }
        */    '*' { respond documentResourceInstance, [status: CREATED] }
        }
    }

    def edit(DocumentResource documentResourceInstance) {
        respond documentResourceInstance
    }

    @Transactional
    def update(DocumentResource documentResourceInstance) {
        if (documentResourceInstance == null) {
            notFound()
            return
        }

        if (documentResourceInstance.hasErrors()) {
            respond documentResourceInstance.errors, view:'edit'
            return
        }

        documentResourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DocumentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
                redirect documentResourceInstance
            }
            '*'{ respond documentResourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DocumentResource documentResourceInstance) {

        if (documentResourceInstance == null) {
            notFound()
            return
        }

        documentResourceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocumentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
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
