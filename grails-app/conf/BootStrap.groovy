import com.linksharing.HttpRequestMetaClassEnhancer
import linksharing.Role
import linksharing.User
import linksharing.UserRole

class BootStrap {
    def grailsApplication

    def init = { servletContext ->
        def mailService
        User defaultUser = null;
        try{

            def userRole = getOrCreateRole("ROLE_USER")
            def adminRole = getOrCreateRole("ROLE_ADMIN")

            HttpRequestMetaClassEnhancer.enhanceRequest()
            if(!User.findByUsername('admin')){//Fail-Safe insertion
                defaultUser = new User();
                defaultUser.firstName = 'admin'
                defaultUser.lastName = 'admin'
                defaultUser.username = 'admin'
                defaultUser.age = 23
                defaultUser.city = 'Reston'
                defaultUser.country = 'USA'
                defaultUser.emailID = 'banti.prajapati@intelligrape.com'
                defaultUser.password = 'r1tew0rk'
                defaultUser.passwordConfirm = 'r1tew0rk'
                defaultUser.state='Virginia'
                defaultUser.streetAddress = "Marine Drive"
                defaultUser.enabled=true
                defaultUser.errors.each {
                    println "==========="+it
                }
                defaultUser.save flush:  true

                def rel = UserRole.create(defaultUser, userRole)
            }else{
                defaultUser=User.findByUsername('admin')
            }


            //INSERT INTO `linkSharing`.`secret_question` (`id`, `version`, `question`) VALUES ('1', '1', 'What is your favourite Sport?');
            //INSERT INTO `linkSharing`.`secret_question` (`id`, `version`, `question`) VALUES ('2', '2', 'What is the name of you first school Teacher?');
        }catch (Exception e){
            e.printStackTrace();
            println defaultUser.errors.allErrors
        }
    }
    def destroy = {

    }

    private getOrCreateRole(name) {
        def role = Role.findByAuthority(name)
        if (!role) role = new Role(authority: name).save()
        if (!role)  println "Unable to save role ${name}"
        return role
    }
}
