package linksharing.resource

import linksharing.UserSubscriptionDetails

class Topic {
    String name
    String description
    String visibility
    static hasMany = [resources:Resource]
    static constraints = {

    }
}
