package sredime

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import sredime.auth.Role
import sredime.auth.User
import sredime.auth.UserRole
import groovy.time.TimeCategory

@Transactional

class ZaposleniController {

    def springSecurityService

    @Secured('ROLE_SALON')
    def index() {
        render view: '../zaposleni'
    }

    @Secured('ROLE_SALON')
    def indexAdmin() {
        render view: '../prikazZaposlenih'
    }

    @Secured('ROLE_SALON')
    def showEmployees() {
        render view: '../zaposleni'
    }

    @Secured('ROLE_SALON')
    def saveEmployee() {

        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)


        if (!salon) {
            render([success: false, message: "Salon nije pronađen."] as JSON)
            return
        }
//        def usluge = SalonUsluge.findAllBySalon(salon)?.usluge //niz koji saljem
        def uslugeId = params.uslugaId?.split(',')

//        def zaposleni = Zaposleni.get(params.zaposleniId as Long)
        def zaposleniId = params.zaposleniId?.split(',')

        if (!uslugeId || !zaposleniId) {
            render([success: false, message: "Paramteri nijesu dobri."] as JSON)
            return
        }
        zaposleniId.each { id ->
            def zaposleni = Zaposleni.findById(id as Long)
            uslugeId.each { uslugaId ->
                def usluge = SalonUsluge.findByIdAndSalon(uslugaId as Long, salon)?.usluge
                if (usluge) {
                    def zaposleniUsluge = new ZaposleniUsluge()
                    zaposleniUsluge.zaposleni = zaposleni
                    zaposleniUsluge.usluge = usluge
                    zaposleniUsluge.save();
                }

            }
        }
        render([success: true] as JSON)


    }

    @Secured('ROLE_SALON')
    def showEmployee() {

        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)

        if (salon) {
            render(view: '../zaposleni', model: [idSalon: salon.id, nazivSalona: salon.nazivSalona])
        } else {
            render([success: false] as JSON)
        }
    }

    @Secured('ROLE_SALON')
    def displayEmployee() {
        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)
        def zaposleni = Zaposleni.findAllBySalonAndIsActive(salon, true)

        def data = []


        zaposleni.each { z ->

            data += [Ime: z.ime, Prezime: z.prezime, JMBG: z.jmbg, Salon: z.salon.nazivSalona, id: z.id, "Radno vrijeme": z.radnoVrijeme, "Kontakt": z.brojTelefona, "Izmjena": "", "Brisanje": "", "Prikaz": ""]
        }

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_SALON')
    def displayAllServices() {

        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)
        def usluge = SalonUsluge.findAllBySalon(salon)?.usluge

        def data = []

        usluge.each { usluga ->
            data += [nazivUsluge: usluga.nazivUsluge, cijenaUsluge: usluga.cijenaUsluge, tipUsluge: usluga.tipUsluge.nazivUsluge, id: usluga.id, "Izmjena": "", "Brisanje": " "]
        }

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_SALON')
    def displaySalon() {
        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)

        def data = []

        data += [nazivSalona: salon.nazivSalona, grad: salon.grad.ime, ulica: salon.ulica,
                 salonUser  : salon.salonUser.username, id: salon.id, userId: salon.salonUser.id,
                 tipSalona  : salon.tipSalona.naziv, "Verifikovan": salon.isVerified, "Izmjena": "", "Brisanje": " "]

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_SALON')
    def editEmployee() {
        def zaposleni = Zaposleni.get(params.id as Long)

        def data = []
        data = [ime: zaposleni.ime, prezime: zaposleni.prezime, radnoVrijeme: zaposleni.radnoVrijeme, brojTelefona: zaposleni.brojTelefona]

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_SALON')
    def saveEditedEmployee() {
        def zaposleni = Zaposleni.get(params.id as Long)

        zaposleni.ime = params.ime
        zaposleni.prezime = params.prezime
        zaposleni.brojTelefona = params.brojTelefona
        zaposleni.radnoVrijeme = params.radnoVrijeme

        zaposleni.save()

        render([success: true] as JSON)
    }

    @Secured('ROLE_SALON')
    def deleteEmployee() {
        def zaposleni = Zaposleni.get(params.id as Long)
        def zaposleniUsluge = ZaposleniUsluge.findAllByZaposleni(zaposleni)

        zaposleniUsluge.each { zaposleniUsluga ->
            zaposleniUsluga.delete(flush: true)
        }


        def appointments = Appointment.findAllByZaposleni(zaposleni)
        def appointmentsArray = []
        appointments.each { appointment ->
            appointmentsArray += [appointment]
        }

        if (appointmentsArray.isEmpty()) {
            zaposleni.isActive = false
            zaposleni.save()
            def user = zaposleni.zaposleniUser
            user.enabled = false
            user.save()

            render([success: true] as JSON)
        } else {
            def user = zaposleni.zaposleniUser
            user.enabled = true
            user.save()
            render([success: false] as JSON)
        }

    }

    @Secured('ROLE_SALON')
    def showEmployeeDetailTable() {
        def zaposleni = Zaposleni.get(params.id as Long)
        def appointments = Appointment.findAllByZaposleni(zaposleni)
        def services
        appointments.each { appointment ->
            services = AppointmentService.findAllByAppointment(appointments)?.service
        }

        def data = []

        data = [ime: zaposleni.ime, prezime: zaposleni.prezime, brojTelefona: zaposleni.brojTelefona,
                id : zaposleni.id, usluge: services]

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_SALON')
    //ovo ovdje bih cak i makla jer zasto bi zaposleni mogao da se uloguje preko salona
    //prosto nema smisla!
    def loginEmployee() {
        render view: "../auth/auth"
    }

    @Secured('ROLE_SALON')
    def registrationEmployee() {
        render view: "/registrationEmployee"
    }

    @Secured('ROLE_SALON')
    def createEmployee() {
        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)

        def name = params.name
        def surname = params.surname
        def username = params.username
        def email = params.email
        def phonenumber = params.phonenumber
        def workHoursStart = params.startWorkHours
        def workHoursEnd = params.endWorkHours
        def jmbg = params.JMBG
        def password = params.password
        def repeatedPassword = params.repeatedPassword

        def zaposleni = new Zaposleni()
        zaposleni.ime = name
        zaposleni.prezime = surname
        zaposleni.brojTelefona = phonenumber
        zaposleni.pocetakRadnoVrijeme = workHoursStart as Integer
        zaposleni.krajRadnoVrijeme = workHoursEnd as Integer
        zaposleni.jmbg = jmbg
        zaposleni.radnoVrijeme = workHoursStart + "-" + workHoursEnd
        zaposleni.salon = salon
        def roleId = Role.findByAuthority("ROLE_EMPLOYEE")
        if (username.length() >= 3 && username.length() <= 15) {
            if (!User.findByUsername(username) || !User.findByEmail(email)) {
                def newUser = new User(name: name, username: username, password: password, email: email).save(flush: true, failOnError: true)
                if (!UserRole.findByUserAndRole(newUser, roleId)) {
                    UserRole.create(newUser, roleId)
                }
                zaposleni.zaposleniUser = newUser
                zaposleni.save()
                render([success: true] as JSON)
            } else {
                render([success: false] as JSON)
            }
        }

    }

    @Secured('ROLE_EMPLOYEE')
    def showEmployeePage() {
        render view: "/showEmployee"
    }

    @Secured('ROLE_SALON')
    def displayEmployees() {
        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)
        def zaposleni = Zaposleni.findAllBySalon(salon)

        def data = []

        zaposleni.each { z ->

            data += [ime: z.ime, prezime: z.prezime, id: z.id]
        }

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_EMPLOYEE')
    def displayAppointmentView() {
        render view: '/appointmentViewEmployee'
    }

    @Secured('ROLE_EMPLOYEE')
    def getApprovedAppointments() {
        def zaposleniUser = springSecurityService.currentUser
        def zaposleni = Zaposleni.findByZaposleniUser(zaposleniUser)
        def startDate = (new Date()).clearTime()
        def endDate = new Date().clearTime()
//        use(TimeCategory) { startDate = startDate - 1.days }
        use(TimeCategory) { endDate = endDate + 7.days }
        def appointments = Appointment.findAllByStatusAndZaposleniAndDateBetween("Odobreno", zaposleni, startDate, endDate)
        def data = []

        appointments.each { appointment ->
            def services = AppointmentService.findAllByAppointment(appointment)?.service
            services.each { service ->
                data += [id          : appointment.id,
                         vrijeme     : appointment.time,
                         cijenaUsluge: service.cijenaUsluge,
                         nazivUsluge : service.nazivUsluge,
                         tipUsluge   : service.tipUsluge.nazivUsluge,
                         datum       : appointment.date,
                         dayId       : appointment.date - startDate + 1

                ]
            }
        }

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_EMPLOYEE')
    def showProfile() {
        def employeeUser = springSecurityService.currentUser
        def employee = Zaposleni.findByZaposleniUser(employeeUser)

        render(view: '/employeeProfile', model: [ime         : employee.ime,
                                                 prezime     : employee.prezime,
                                                 id          : employee.id,
                                                 brojTelefona: employee.brojTelefona,
                                                 username    : employeeUser.username,
                                                 email       : employeeUser.email
        ])
    }

    @Secured('ROLE_EMPLOYEE')
    def getEmployeeData() {
        def employeeUser = springSecurityService.currentUser
        def employee = Zaposleni.findByZaposleniUser(employeeUser)

        def data = []

        def appointments = Appointment.findAllByZaposleniAndStatus(employee, "Odobreno")
        appointments.each { appointment ->
            def services = AppointmentService.findAllByAppointment(appointment)?.service
            services.each {
                service ->
                    data += [nazivUsluge: service.nazivUsluge, cijenaUsluge: service.cijenaUsluge]
            }

        }

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_EMPLOYEE')
    def editEmployeeProfile() {
        def zaposleniUser = springSecurityService.currentUser
        def zaposleni = Zaposleni.findByZaposleniUser(zaposleniUser)
        def name = params.name
        def email = params.email
        def number = params.number
        def address = params.address

        String regex = "[,\\.\\s]"
        String[] arr = name.split(regex)


        zaposleni.ime = arr[0]
        zaposleni.prezime = arr[1]
        zaposleniUser.email = email
        zaposleni.brojTelefona = number
        zaposleniUser.save()
        zaposleni.save()

        render([success: true] as JSON)
    }

    @Secured("ROLE_EMPLOYEE")
    def showService() {
        def zaposleniUser = springSecurityService.currentUser
        def zaposleni = Zaposleni.findByZaposleniUser(zaposleniUser)

        render(view: '/uslugeZaposleni', model: [ime                : zaposleni.ime,
                                                 prezime            : zaposleni.prezime,
                                                 pocetakRadnoVrijeme: zaposleni.pocetakRadnoVrijeme,
                                                 krajRadnoVrijeme   : zaposleni.krajRadnoVrijeme,
                                                 nazivSalona        : zaposleni.salon.nazivSalona,

        ])
    }

    @Secured("ROLE_EMPLOYEE")
    def showServicesForEmployee() {
        def zaposleniUser = springSecurityService.currentUser
        def zaposleni = Zaposleni.findByZaposleniUser(zaposleniUser)

        def usluge = ZaposleniUsluge.findAllByZaposleni(zaposleni)?.usluge
        def data = []
        usluge.each { usluga ->
            data += [nazivUsluge: usluga.nazivUsluge, cijenaUsluge: usluga.cijenaUsluge]
        }
        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_EMPLOYEE")
    def showRevenue() {
        def zaposleniUser = springSecurityService.currentUser
        def zaposleni = Zaposleni.findByZaposleniUser(zaposleniUser)

        render(view: '/revenueEmployee', model: [ime        : zaposleni.ime,
                                                 prezime    : zaposleni.prezime,
                                                 nazivSalona: zaposleni.salon.nazivSalona
        ])
    }
    @Secured("ROLE_EMPLOYEE")
    def getRevenueForEachMonth() {
        def zaposleniUser = springSecurityService.currentUser
        def zaposleni = Zaposleni.findByZaposleniUser(zaposleniUser)
        def godina = params.year
        def mjesec = params.month

        if (!zaposleni) {
            render([success: false, message: "Greška. Ne postoji zaposleni!"] as JSON)
            return
        }
        def startDate = Date.parse("yyyy-MM", "$godina-$mjesec")
        def endDate = startDate.clone()
        endDate[Calendar.MONTH] += 1


        def appointments = Appointment.findAllByZaposleniAndStatusAndDateBetween(zaposleni, "Odobreno", startDate, endDate)
        def uslugaZarada = []

        appointments.each { appointment ->
            def usluge = AppointmentService.findAllByAppointment(appointment)?.service
            usluge.each { usluga ->

                uslugaZarada += [cijenaUsluge: usluga.cijenaUsluge, nazivUsluge: usluga.nazivUsluge]
            }
        }

        render([success: true, data: uslugaZarada] as JSON)
    }
}


