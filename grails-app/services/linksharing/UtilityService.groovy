package linksharing

import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Transactional
class UtilityService {

    def serviceMethod() {

    }

    static Boolean isValidString(String string){
        string==null  || string == 'null' || string.trim() =='' ?false:true;
    }


   static Boolean uploadFile(GrailsParameterMap params,def fileBytes){
       String contentType = "";
       String fileName = "";
       int size = 0;
       println ">>>>>>>>>>>>>>>>>>>>>>"+params.topic

       CommonsMultipartFile uploadedFile = params.file

       if(uploadedFile){
           contentType =  uploadedFile.contentType
           fileName = uploadedFile.originalFilename
           size = uploadedFile.size
           params.fileType = contentType
           params.fileName=fileName;
       }

       if (!fileBytes?.empty ) {
           try{

               fileBytes.transferTo(new File("/home/prajapati/Desktop/project/builddocs/"+ fileName))
           }catch (Exception e){
            println "Exception while uploading file"
               return false;
           }
           return true
       }

   }
}
