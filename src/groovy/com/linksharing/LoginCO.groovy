package com.linksharing

import grails.validation.Validateable
import linksharing.User
import linksharing.UtilityService

/**
 * Created by prajapati on 2/6/14.
 */
@Validateable
class LoginCO {

    String userName;
    String password;
    String emailID;
    String loginWith;
    String rememberMe;

    static  constraints={
        userName  nullable: true, validator:{userName,obj->
            println "=========="+userName
            println "=========obj.loginWith="+obj.loginWith
            if( (userName==null || userName=='') && obj.loginWith=='uName'){
                return "Invalid.user.name.value"
            }else if((obj.emailID == null || obj.emailID == '') && obj.loginWith == 'emailID'){
                return 'Invalid.user.mailID.value'
            }else if(obj.password == null || obj.password == ""){
                return "blank.user.password.value"
            }
            else{
                User user = User.createCriteria().get(){
                    if(obj.loginWith=='uName'){
                        eq("userName",obj.userName)
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