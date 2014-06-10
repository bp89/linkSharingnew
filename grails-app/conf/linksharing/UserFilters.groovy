package linksharing

import org.apache.commons.lang.StringEscapeUtils
import org.apache.commons.lang.StringUtils

class UserFilters {
    UtilityService utilityService
    def filters = {

        //all(controller: '*', action:'*') {
        all( controller: 'user',action:'create|dashboard|invalidLogin|login|forgotPassword|sendResetMail|resetPassword|save',invert:true) {
            before = {
                String userID = session.getAttribute("userID");
                //setting session to expiry in 30 mins
                println ">>>>>>>>>>>>>>>>>>"+userID

                User user = null;
                if(utilityService.isValidString(userID)){
                    user = User.get(Long.parseLong(userID));
                }

                if (user) {
                    println "===coming inside========"
                    session.setMaxInactiveInterval(30 * 60 * 60)
                } else {
                    flash.put("invalidLogin","You are not logged in.")
                    redirect(controller: 'user',action: 'invalidLogin')
                    return false;
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
