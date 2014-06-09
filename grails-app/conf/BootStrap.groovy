import com.linksharing.HttpRequestMetaClassEnhancer
import linksharing.User

class BootStrap {
    def grailsApplication

    def init = { servletContext ->
        def mailService
        User defaultUser = null;
        try{

            HttpRequestMetaClassEnhancer.enhanceRequest()
            if(!User.findByUserName('admin')){//Fail-Safe insertion
                defaultUser = new User();
                defaultUser.firstName = 'admin'
                defaultUser.lastName = 'admin'
                defaultUser.userName = 'admin'
                defaultUser.age = 23
                defaultUser.city = 'Reston'
                defaultUser.country = 'USA'
                defaultUser.emailID = 'banti.prajapati@intelligrape.com'
                defaultUser.password = 'admin'
                defaultUser.passwordConfirm = 'admin'
                defaultUser.state='Virginia'
                defaultUser.streetAddress = "Marine Drive"
                defaultUser.save flush:  true
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
}
