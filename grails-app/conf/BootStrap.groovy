import linksharing.User

class BootStrap {
    def grailsApplication

    def init = { servletContext ->
        servletContext.setAttribute("builddocs", "/home/prajapati/Desktop/project/builddocs/")

        User defaultUser = new User();
        defaultUser.firstName = 'admin'
        defaultUser.lastName = 'admin'
        defaultUser.userName = 'admin'
        defaultUser.age = 23
        defaultUser.city = 'Reston'
        defaultUser.country = 'USA'
        defaultUser.emailID = 'banti.prajapati@intelligrape.com'
        defaultUser.password = 't0n1ght'
        defaultUser.id=0;
        defaultUser.save flush:  true

    }
    def destroy = {
    }
}
