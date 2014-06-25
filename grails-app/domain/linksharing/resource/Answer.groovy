package linksharing.resource

import com.sun.mail.handlers.text_html
import linksharing.User

class Answer {
        String answer;

    static  belongsTo = [question:Question,user:User]
    static constraints = {

    }

    static  mapping = {
        answer type:'text'
    }
}
