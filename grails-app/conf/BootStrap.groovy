import com.linksharing.HttpRequestMetaClassEnhancer
import linksharing.User

class BootStrap {
    def grailsApplication

    def init = { servletContext ->
def mailService
        try{

            HttpRequestMetaClassEnhancer.enhanceRequest()


            User defaultUser = new User();
            defaultUser.firstName = 'admin'
            defaultUser.lastName = 'admin'
            defaultUser.userName = 'admin'
            defaultUser.age = 23
            defaultUser.city = 'Reston'
            defaultUser.country = 'USA'
            defaultUser.emailID = 'banti.prajapati@intelligrape.com'
            defaultUser.password = 'J@ishr33r@m'
            defaultUser.passwordConfirm = 'J@ishr33r@m'
            defaultUser.state='Virginia'
            defaultUser.streetAddress = "Marine Drive"
            defaultUser.save flush:  true




        }catch (Exception e){
            e.printStackTrace();
            println defaultUser.errors.allErrors
        }
    }
    def destroy = {
    }
}
