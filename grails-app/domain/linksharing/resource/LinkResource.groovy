package linksharing.resource

class LinkResource extends Resource{
    String link

    static constraints = {
        title nullable: false,blank: false
        link  nullable: false,blank: false,url: true
    }
}
