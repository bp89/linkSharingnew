import linksharing.User

class BootStrap {
    def grailsApplication

    def init = { servletContext ->
        servletContext.setAttribute("builddocs", "/home/prajapati/Desktop/project/builddocs/")

        try{
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

            println defaultUser.errors.allErrors
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    def destroy = {
    }
}
