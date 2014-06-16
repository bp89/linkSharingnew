package com.linksharing

import grails.validation.Validateable
import linksharing.User

/**
 * Created by prajapati on 3/6/14.
 */
@Validateable
class UpdatePasswordCO {
    String password;
    String passwordConfirm;
    String secretKeyToResetPassword
    Long userID;

    static  constraints = {
        password blank:false
        passwordConfirm blank:false,validator{passwordConfirm,obj ->

            User user = User.createCriteria().get {
                eq('secretKeyToResetPassword',obj.secretKeyToResetPassword);
            }

            if(!user){
                return 'expired.secret.code.to.reset.password';
            }else if(passwordConfirm != obj.password){
                return ['invalid.matchingpasswords'];
            }else{
                return true;
            }
        }

    }
}
