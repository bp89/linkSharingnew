package linksharing

import org.apache.commons.lang.StringEscapeUtils
import org.apache.commons.lang.StringUtils

class UserFilters {
UtilityService utilityService
    def filters = {

         //all(controller: '*', action:'*') {
       notUser( controller: 'user',uriExclude:'/') {
            before = {
                String userID = session.getAttribute("userID");
                //setting session to expiry in 30 mins

                User user = User.get(Long.parseLong(userID));
                if (user) {
                    session.setMaxInactiveInterval(30 * 60);
                } else {
                    render view: 'invalidLogin'
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
