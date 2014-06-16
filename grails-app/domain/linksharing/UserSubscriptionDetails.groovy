package linksharing

import linksharing.resource.Topic

class UserSubscriptionDetails {

    Date subscribedOn
    String comments
    String seriousnessLevel

    static belongsTo = [user:User,topic:Topic]
    static constraints = {

    }
    static mapping = {
        seriousnessLevel default:''
    }
}
