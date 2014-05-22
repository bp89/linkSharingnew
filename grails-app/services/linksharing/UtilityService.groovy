package linksharing

import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class UtilityService {
    def grailsApplication

    def serviceMethod() {

    }

     Boolean isValidString(String string){
        string==null  || string == 'null' || string.trim() =='' ?false:true;
    }


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
}
