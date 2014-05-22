package linksharing

import linksharing.resource.Topic

class User {

    String firstName;
    String lastName;
    String password;
    String passwordConfirm;
    int age;
    String country;
    String city;
    String state;
    String streetAddress;
    String userName;
    String emailID;

    static transients = ['passwordConfirm']

    static hasMany = [userSubscriptionDetails:UserSubscriptionDetails,topics:Topic]

    //static  belongsTo = [topic:Topic]


    static constraints = {
        password   minSize: 8,maxSize: 16,blank:false,nullable: false,validator:{ password, obj ->
            def password2 = obj.passwordConfirm
            println password
            println password2
            password2 == password ? true : ['invalid.matchingpasswords']
        }
        passwordConfirm bindable:true
        emailID(email:true)
        age([min: 18])
        userName([size:3..20, unique: true])
        /*userName validator: {userName ->
            userName.matches(" ^[0-9a-zA-Z,.-]+?[0-9a-zA-Z]+?[0-9a-zA-Z,.-]*$")
        }*/
    }


    static mapping = {

    }


}
