package linksharing

import com.sun.org.apache.xpath.internal.operations.Bool
import linksharing.resource.Resource
import linksharing.resource.ResourceSettings
import linksharing.resource.Topic

class User {

    String firstName;
    String lastName;
    String password;
    String passwordConfirm;
    int age

    String country;
    String city;
    String state;
    String streetAddress;
    String userName;
    String emailID;
    String secretKeyToResetPassword;
    String answer
    Boolean isAdmin;
    static transients = ['passwordConfirm']

    static hasMany = [userSubscriptionDetails:UserSubscriptionDetails,topics:Topic,resourceSettings:ResourceSettings,resources:Resource]

    static  belongsTo = [secretQuestion:SecretQuestion]


    static constraints = {
        password   minSize: 8,maxSize: 16,blank:false,nullable: false,validator:{ password, obj ->
            def password2 = obj.passwordConfirm
            password2 == password ? true : ['invalid.matchingpasswords']
        }
        answer nullable: true
        passwordConfirm bindable:true
        emailID(email:true)
        age([min: 18])
        userName([size:3..20, unique: true])
        /*userName validator: {userName ->
            userName.matches(" ^[0-9a-zA-Z,.-]+?[0-9a-zA-Z]+?[0-9a-zA-Z,.-]*$")
        }*/
        answer nullable: true
        secretKeyToResetPassword nullable: true
        secretQuestion nullable: true
        isAdmin nullable: true

    }


    static mapping = {
        secretKeyToResetPassword type: 'text'
        isAdmin default:false
    }


}
