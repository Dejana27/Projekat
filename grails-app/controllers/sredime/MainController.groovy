package sredime

import grails.plugin.springsecurity.annotation.Secured
import sredime.auth.UserRole

@Secured('isAuthenticated()')
class MainController {


    def springSecurityService
    def index() {

        def user = springSecurityService.currentUser
        def userRole = UserRole.findByUser(user)

        def role = userRole.role?.authority

        if(role == "ROLE_ADMIN") {

            redirect(action:"index", controller: "admin")
        } else if (role == "ROLE_SALON") {
            redirect(action:'showSalon', controller: 'salon')
        } else if (role == "ROLE_EMPLOYEE") {
            redirect(action: 'showProfile', controller: 'zaposleni')
        }
        else {

            render view: '/home'
        }

    }

}
