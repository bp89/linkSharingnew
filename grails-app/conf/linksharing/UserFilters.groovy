package linksharing

import org.apache.commons.lang.StringEscapeUtils
import org.apache.commons.lang.StringUtils

class UserFilters {

    def filters = {

         //all(controller: '*', action:'*') {
       all( controller: '*', action:'create|invalidLogin', invert:true,uriExclude:'/linksharing/') {
            before = {
                String userName = session.getAttribute("user");
                //setting session to expiry in 30 mins
                if (UtilityService.isValidString(userName)) {
                    session.setMaxInactiveInterval(30 * 60);
                    session.removeAttribute("user");
                } else {
                    if(!controllerName == 'simpleCaptcha' ){
                        redirect(controller: 'user', action: 'invalidLogin')
                    }
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
