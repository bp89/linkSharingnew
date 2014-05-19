package linksharing.resource

abstract class Resource {

    String title
    String description
    //static hasMany = [linkResources:LinkResource,documentResources:DocumentResource]
    static  belongsTo = [topic:Topic]

    static constraints = {
    }

    static mapping = {
       // tablePerConcreteClass true
        tablePerSubclass false
    }
}
