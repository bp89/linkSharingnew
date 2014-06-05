package linksharing.resource

import linksharing.User
import linksharing.UserSubscriptionDetails

class Topic {
    String name
    String description
    String visibility

    static hasMany = [resources:Resource,userSubscriptionDetails:UserSubscriptionDetails]
    static belongsTo =  [owner:User]
    static constraints = {
        name nullable: false,blank: false,unique: true
        visibility   nullable: false,blank: false, validator: {visibility,topic ->

            if(!(visibility=='Private' || visibility=='Public')){
                return ['invalid.visibility']
            }
        }
        description minSize: 150, maxSize: 500
    }
    static mapping = {
        description type:'text'

    }

    def findResources(Class className){//it should be there user default otherwise
        if(!resources){
            return 0
        }else{
            return resources.count {
                it.instanceOf( className )
            }
        }
    }

}
