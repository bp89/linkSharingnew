package linksharing


import linksharing.resource.Resource
import linksharing.resource.ResourceSettings
import linksharing.resource.Topic

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
    String firstName;
    String lastName;
    String passwordConfirm;
    int age
    String country;
    String city;
    String state;
    String streetAddress;
    String emailID;
    String secretKeyToResetPassword;
    String answer
	static transients = ['springSecurityService','passwordConfirm']

    static hasMany = [userSubscriptionDetails:UserSubscriptionDetails,topics:Topic,resourceSettings:ResourceSettings,resources:Resource]

    static  belongsTo = [secretQuestion:SecretQuestion]


    static constraints = {
        password   minSize: 8,blank:false,nullable: false
        /*validator:{ password, obj ->
            def password2 = obj.passwordConfirm
            password2 == password ? true : ['invalid.matchingpasswords']
        }*/
        answer nullable: true
        passwordConfirm bindable:true
        emailID(email:true)
        age([min: 18])
        username([size:3..20, unique: true])
        /*username validator: {username ->
            username.matches(" ^[0-9a-zA-Z,.-]+?[0-9a-zA-Z]+?[0-9a-zA-Z,.-]*$")
        }*/
        answer nullable: true
        secretKeyToResetPassword nullable: true
        secretQuestion nullable: true
        username blank: false, unique: true
    }


    static mapping = {
        secretKeyToResetPassword type: 'text'
        password column: '`password`',type:'text'
    }

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
