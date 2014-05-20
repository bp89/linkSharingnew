package linksharing

import grails.transaction.Transactional

@Transactional
class UtilityService {

    def serviceMethod() {

    }

    static Boolean isValidString(String string){
        string==null  || string == 'null' || string.trim() =='' ?false:true;
    }
}
