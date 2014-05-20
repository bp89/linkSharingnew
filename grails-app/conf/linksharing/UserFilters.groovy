package linksharing

import org.apache.commons.lang.StringEscapeUtils
import org.apache.commons.lang.StringUtils

class UserFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
                String userName = session.getAttribute("user");
                //setting session to expiry in 30 mins
                println ">>>>>>>>>>>>>>>>"+userName
                if( UtilityService.isValidString(userName)){
                    session.setMaxInactiveInterval(30*60);
                    session.removeAttribute("user");
                }else{
                    redirect (controllerName:'user',action:'invalidLogin')
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
