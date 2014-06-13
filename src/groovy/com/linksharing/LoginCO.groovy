package com.linksharing

import grails.validation.Validateable
import linksharing.User
import linksharing.UtilityService

/**
 * Created by prajapati on 2/6/14.
 */
@Validateable
class LoginCO {

    String username;
    String password;
    String emailID;
    String loginWith;
    String rememberMe;

    static  constraints={
        username  nullable: true, validator:{username,obj->
            println "=========="+username
            println "=========obj.loginWith="+obj.loginWith
            if( (username==null || username=='') && obj.loginWith=='uName'){
                return "Invalid.user.name.value"
            }else if((obj.emailID == null || obj.emailID == '') && obj.loginWith == 'emailID'){
                return 'Invalid.user.mailID.value'
            }else if(obj.password == null || obj.password == ""){
                return "blank.user.password.value"
            }
            else{
                User user = User.createCriteria().get(){
                    if(obj.loginWith=='uName'){
                        eq("username",obj.username)
                    }else{
                        eq("emailID",obj.emailID)
                    }
                    eq("password",obj.password)
                }
                if(user){
                    return true;
                }else{
                    return 'Invalid.login.details'
                }
            }
        }

        emailID email:true,nullable: true

    }
}