package linksharing

class User {

    String firstName;
    String lastName;
    String password;
    int age;
    String country;
    String city;
    String state;
    String streetAddress;
    String userName;
    String emailID;

    static hasMany = [userSubscriptionDetails:UserSubscriptionDetails]
    static constraints = {
        password([blank:false,nullable: false,unique: true])
        emailID(email:true)
        age([min: 18])
        userName([size:3..20, unique: true])
    }


    static mapping = {

    }


}
