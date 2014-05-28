package linksharing.resource

import linksharing.User

class ResourceSettings {

    String readStatus

    static belongsTo = [user:User,resource:Resource]

    static constraints = {

    }
    static mapping = {
        readStatus defaultValue:'unread'
    }

}
