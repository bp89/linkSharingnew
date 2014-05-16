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

    }
}
