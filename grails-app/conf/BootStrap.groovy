class BootStrap {
    def grailsApplication

    def init = { servletContext ->
        servletContext.setAttribute("builddocs", "/home/prajapati/Desktop/project/builddocs/")
    }
    def destroy = {
    }
}
