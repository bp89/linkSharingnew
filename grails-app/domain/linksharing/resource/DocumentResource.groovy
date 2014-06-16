package linksharing.resource

class DocumentResource extends Resource{
    String fileName
    String fileType;


    static constraints = {
            fileName nullable: false,blank: false,minSize: 3,maxSize: 50
            fileType blank: false


    }
    static mapping = {
        fileType default:'application/octet'
    }
}
