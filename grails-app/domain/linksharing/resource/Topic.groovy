package linksharing.resource

import linksharing.UserSubscriptionDetails

class Topic {
    String name
    String description
    String visibility
    static hasMany = [userSubscriptionDetails:UserSubscriptionDetails,resources:Resource]
    static constraints = {
    }
}
