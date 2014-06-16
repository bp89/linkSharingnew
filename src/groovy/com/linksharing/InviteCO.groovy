package com.linksharing

import grails.validation.Validateable

/**
 * Created by prajapati on 10/6/14.
 */

@Validateable
class InviteCO {
    String topicId
    String sendInvite
    String sendMail


    static  constraints={
        topicId validator: {
            if( it == null || it.trim() == '' ){
                return ['invalid.topic.id.not.selected']
            }
        }
        sendInvite validator: {
            if( it == null || it.trim() == '' ){
                return ['invalid.invite.id.not.selected']
            }
        }

    }


}
