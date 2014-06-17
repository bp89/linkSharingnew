package linksharing

import org.apache.commons.lang.StringEscapeUtils
import org.apache.commons.lang.StringUtils

class UserFilters {
    UtilityService utilityService
    def springSecurityService
    def filters = {


        /*  all( controller: 'user',action:'create|dashboard|invalidLogin|login|forgotPassword|sendResetMail|resetPassword',invert:true) {
              before = {
                  String userID = session.getAttribute("userID");
                  //setting session to expiry in 30 mins
                  println ">>>>>>>>>>>>>>>>>>"+userID

                  User user = null;
                  if(utilityService.isValidString(userID)){
                      user = User.get(Long.parseLong(userID));
                  }

                  if(!controllerName || controllerName.equals("")) {
                      return true
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
          }*/

        all(controller: 'user', action:'create|invalidLogin|login|forgotPassword|sendResetMail|resetPassword',invert:true) {
            before = {
                log.info "====================Controller================"+controllerName
                log.info "====================Action Name================"+actionName
                /*if(!controllerName || controllerName.equals("") || "login".equals(controllerName) || "logout".equals(controllerName)) {
                    return true
                }
                else if (!springSecurityService.isLoggedIn()) {
                    redirect controller: 'login', action: 'auth', params: params
                    return false;
                }
                else {
                    return true
                }*/
                return true
            }
        }
    }
}