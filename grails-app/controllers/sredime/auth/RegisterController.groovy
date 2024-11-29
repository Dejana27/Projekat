package sredime.auth

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import sredime.Grad
import sredime.Salon
import sredime.TipSalona
import sredime.TipUsluge
import sredime.Usluge

@Secured('permitAll')
@Transactional
class RegisterController {

    def show() {
        render view: "../auth/register"
    }
//    ../../views/auth/register
    def index() {
        render view: "/index"
    }

    def createUser() {

        def name = params.name as String
        def lastName = params.lastName as String
        def phoneNumber = params.phoneNumber as String
        def username = params.username as String
        def email = params.email as String
        def password = params.password

        def roleId = Role.findByAuthority("ROLE_USER")
        if (username.length() >= 3 && username.length() <= 15) {
            if (!User.findByUsername(username) || !User.findByEmail(email)) {
                def newUser = new User(name: name, lastName: lastName, phoneNumber: phoneNumber, username: username, password: password, email: email).save(flush: true, failOnError: true)
                if (!UserRole.findByUserAndRole(newUser, roleId)) {
                    UserRole.create(newUser, roleId)

                }
                render([success: true] as JSON)
            } else {
                render([success: false, message: 'vec postoji'] as JSON)
            }
        }


    }

    def createSalonUser() {
        def salonName = params.name
        def salonNumber = params.number
        def userEmail = params.email
        def userPassword = params.password
        def passwordRepeat = params.repeatedPassword
        def userUsername = params.username
        def salon = new Salon()
        def city = Grad.get(params.cityId as Long)
        def street = params.street
        def service = TipSalona.get(params.serviceId as Long)
        def workDays = params.workDays
        def workHoursStart = params.workHoursStart as Integer
        def workHoursEnd = params.workHoursEnd as Integer
        def workHours = "${workHoursStart}-${workHoursEnd}"
//        def salon = new Salon()
//        usluge.tipUsluge = service
//        usluge.save()
        if (!city || !service) {
            render([success: false, message: "Grad ili tip salona nisu validni"] as JSON)
            return
        }

        if (userPassword != passwordRepeat) {
            render([success: false, message: "Lozinke se ne poklapaju"] as JSON)
            return
        }

        if (User.findByUsername(userUsername)) {
            render([success: false, message: "Korisničko ime već postoji"] as JSON)
            return
        }

        if (User.findByEmail(userEmail)) {
            render([success: false, message: "Email već postoji"] as JSON)
            return
        }
        salon.nazivSalona = salonName
        salon.grad = city
//      salon.isVerified = true
        salon.ulica = street
        salon.tipSalona = service
        salon.pocetak = workHoursStart
        salon.kraj = workHoursEnd
        salon.radnoVrijeme = workHours
        salon.radniDani = workDays

        def roleId = Role.findByAuthority("ROLE_SALON")

        if (!User.findByUsername(userUsername) && !User.findByEmail(userEmail)) {
            def newUser = new User(username: userUsername, password: userPassword, email: userEmail, name: salonName).save(flush: true, failOnError: true)
            if (!UserRole.findByUserAndRole(newUser, roleId)) {
                UserRole.create(newUser, roleId)
            }
            salon.salonUser = newUser
            salon.save()
            render([success: true] as JSON)
        } else {
            render([success: false] as JSON)
        }


    }

    def checkEmailAvailability () {
        def email = params.email
        def exists = User.findByEmail(email) != null
        render([isAvailable: !exists] as JSON)
    }


}
