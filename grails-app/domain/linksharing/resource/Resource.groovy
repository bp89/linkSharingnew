package linksharing.resource

import linksharing.User

abstract class Resource {

    String title
    String description

    //static hasMany = [linkResources:LinkResource,documentResources:DocumentResource]
    static  belongsTo = [topic:Topic,user:User]
    static  hasMany = [resourceSettings:ResourceSettings]
    static constraints = {

    }

    static mapping = {
        // tablePerConcreteClass true
        tablePerSubclass false
        topic cascade: 'all'
        creator cascade: 'all'
    }
}
