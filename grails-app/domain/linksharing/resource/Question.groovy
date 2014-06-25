package linksharing.resource

import com.sun.mail.handlers.text_html

class Question extends Resource{

    String question


    static constraints = {
    }

    static hasMany = [answers:Answer,topics:Topic]
    static mapping = {
        question type: 'text'
    }

}
