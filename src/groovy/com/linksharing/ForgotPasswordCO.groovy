package com.linksharing

import grails.validation.Validateable
import linksharing.User
import linksharing.UtilityService

/**
 * Created by prajapati on 28/5/14.
 */
@Validateable
class ForgotPasswordCO {
    String emailID
    String userName

    static  constraints = {
        emailID nullable: true,email: true,validator: {emailID,obj ->
            if(emailID!=''){
                User user = User.createCriteria().get {
                    eq("emailID",emailID)
                }
                if(user == null){
                    return ['invalid.noSuchUserExistsWithEmailId']
                }
            }
        }
        userName nullable: true, validator: {userNameTemp,obj ->

            if(!(obj.emailID == '' || obj.emailID == null) && !(userNameTemp == '' ||userNameTemp == null)){
                println "Jai shree Ram"
                return ['invalid.allowedOnlyOne']
            }else if(obj.emailID!=''){
                User user = User.createCriteria().get {
                    eq("emailID",obj.emailID)
                }

                if(user == null){
                    return ['invalid.noSuchUserExistsWithEmailId']
                }
            }else{
                User user = User.createCriteria().get {
                    eq("userName",userNameTemp)
                }

                if(user == null){
                    return ['invalid.noSuchUserExistsWithUserName']
                }
            }
        }
    }
}
