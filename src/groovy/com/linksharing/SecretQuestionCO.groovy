package com.linksharing

import grails.validation.Validateable
import linksharing.SecretQuestion

/**
 * Created by prajapati on 29/5/14.
 */
@Validateable
class SecretQuestionCO {
    SecretQuestion secretQuestion
    String answer

    static constraints={
        answer nullable:false,blank:false
        secretQuestion nullable:false
    }
}
