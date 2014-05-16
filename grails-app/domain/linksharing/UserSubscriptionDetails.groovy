package linksharing

class UserSubscriptionDetails {

    String subscribedOn
    String comments
    String seriousnessLevel

    static belongsTo = [user:User]
    static constraints = {
    }
}
