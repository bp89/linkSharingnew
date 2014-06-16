package linksharing

import linksharing.resource.Topic


class Invites {

    Date sentOn;
    Date acceptedOn;
    String mailID;


    static belongsTo = [sentBy:User,sentTo:User,topic:Topic]


    static constraints = {
        sentOn nullable: false
        mailID nullable: false
        acceptedOn nullable: true

    }

}
