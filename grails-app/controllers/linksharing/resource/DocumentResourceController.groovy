package linksharing.resource

import grails.transaction.Transactional
import linksharing.UtilityService
import org.springframework.web.multipart.commons.CommonsMultipartFile

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class DocumentResourceController {
UtilityService utilityService
    //def grailsApplication
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

    def download() {
        String buildDir = grailsApplication.config.builddocs
    println buildDir+"/" + params.id+"/" + params.fileName;
        File file = new File(buildDir+ params.id+"/" + params.fileName)

        response.setContentType(params.fileType)

        response.setHeader('Content-Disposition', 'Filename='+params.fileName)
        response.outputStream << file.newInputStream()
    }
    @Transactional
    def save(DocumentResource documentResourceInstance) {
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
                redirect documentResourceInstance
            }
            '*'{ respond documentResourceInstance, [status: OK] }

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
        UtilityService.uploadFile(params,request.getFile('file'))
        documentResourceInstance.properties=params


        if (documentResourceInstance.hasErrors()) {
            respond documentResourceInstance.errors, view:'edit'
            return
        }

        documentResourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message',args: [message(code: 'documentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
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
