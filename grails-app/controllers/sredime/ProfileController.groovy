package sredime

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

import groovy.time.TimeCategory

import java.time.LocalDate
import java.time.format.DateTimeFormatter

@Secured('ROLE_USER')
@Transactional
class ProfileController {
    def springSecurityService

    def index() {

        render(view: "/profile", model: [name: springSecurityService.currentUser.name])
    }

    def booking() {
        render view: "../zakazivanja"
    }

    def update() {
        render view: "../updateProfile"
    }

    def faq() {
        render view: "../faq"
    }

    def appointment() {
        render view: "../appointmentChecked"
    }

    def likes() {
        render view: "../likedSalon"
    }

    def impression() {
        render view: "../impressions"
    }

    def search() {
        render view: "../home"
    }

    def lookbook() {
        render view: "/LookBook"
    }


    def showAppointmentForUser() {
        def user = springSecurityService.currentUser
        def appointment = Appointment.findAllByUser(user)

        def data = []
        appointment.each { a ->
            def usluge = AppointmentService.findAllByAppointment(a)?.service
            usluge.each { usluga ->
                data += [nazivSalona : a.salon.nazivSalona,
                         id          : a.id,
                         vrijeme     : a.time,
                         datum       : new Date(a.date.time).clearTime(),
                         cijenaUsluge: usluga.cijenaUsluge,
                         nazivUsluge : usluga.nazivUsluge,
                         tipUsluge   : usluga.tipUsluge,
                         status      : a.status]

            }

        }

        render([success: true, data: data] as JSON)
    }

    @Secured('permitAll')
    def budget() {
        render view: '/budget'
    }

    @Secured('ROLE_SALON')
    def getBudgetForMonth() {
        def user = springSecurityService.currentUser
        def salon = Salon.findAllBySalonUser(user)
        def year = params.year
        def month = params.month

        if (!salon) {
            render([success: false, message: 'Salon nije pronađen.'] as JSON)
            return
        }

        def startDate = Date.parse("yyyy-MM", "$year-$month")
        def endDate = startDate.clone()
        endDate[Calendar.MONTH] += 1

        def appointments = Appointment.findAllBySalonAndStatusAndDateBetween(salon, "Odobreno", startDate, endDate)

        def serviceRevenue = [:]
        def sum = 0
        appointments.each { appointment ->
            def usluge = AppointmentService.findAllByAppointment(appointment)?.service

            usluge.each { usluga ->
                if (!serviceRevenue[usluga.nazivUsluge]) {
                    serviceRevenue[usluga.nazivUsluge] = 0
                }
                serviceRevenue[usluga.nazivUsluge] += usluga.cijenaUsluge
                sum += usluga.cijenaUsluge
            }
        }

        render([success: true, data: serviceRevenue, sum: sum] as JSON)
    }

    @Secured("ROLE_SALON")
    def getBudgetForYear() {
        def user = springSecurityService.currentUser
        def salon = Salon.findAllBySalonUser(user)
        def year = params.year

        def sum = 0
        if (!salon) {
            render([success: true, message: 'Salon nije pronađen.'] as JSON)
            return
        }

        def startDate = Date.parse("yyyy", year)
        def endDate = startDate.clone()
        endDate[Calendar.YEAR] += 1

        def appointments = Appointment.findAllBySalonAndStatusAndDateBetween(salon, "Odobreno", startDate, endDate)
        def monthlyRevenue = new double[12]
        appointments.each { appointment ->
            def appointmentMonth = appointment.date[Calendar.MONTH]
            def usluge = AppointmentService.findAllByAppointment(appointment)?.service
            usluge.each { usluga ->
                //ovdje mi treba po mjesecima
                monthlyRevenue[appointmentMonth] += usluga.cijenaUsluge
                sum += usluga.cijenaUsluge

            }

        }

        render([success: true, data: monthlyRevenue, sum: sum] as JSON)
    }

    @Secured("ROLE_SALON")
    def getServices() {
        def user = SpringSecurityService.currentUser
        def salon = Salon.findAllBySalonUser(user)
        def services = SalonUsluge.findAllBySalon(salon)?.usluge

        def data = []

        services.each { service ->
            data += [nazivUsluge: service.nazivUsluge, cijenaUsluge: service.cijenaUsluge]
        }
        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_SALON")
    def getRevenueForYear() {
        def user = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(user)
        def startYear = params.startYear.toInteger()
        def endYear = params.endYear.toInteger()

        def data = []

        (startYear..endYear).each { year ->
            def startDate = Date.parse("yyyy", year.toString())
            def endDate = Date.parse("yyyy", (year + 1).toString())

            def appointments = Appointment.findAllBySalonAndStatusAndDateBetween(salon, "Odobreno", startDate, endDate)
            def godisnjaZarada = 0

            appointments.each { appointment ->
                def services = AppointmentService.findAllByAppointment(appointment)?.service
                services.each { service ->
                    godisnjaZarada += service.cijenaUsluge

                }
            }

            data += ["Godina": year, "Zarada": godisnjaZarada]
        }

        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_SALON")
    def getRevenueForMonth() {

        def user = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(user)
        def year = params.year
        def month = params.month

        def data = []

        def startDate = Date.parse("yyyy-MM", "$year-$month")
        def endDate = startDate.clone()
        endDate[Calendar.MONTH] += 1

        def appointments = Appointment.findAllBySalonAndStatusAndDateBetween(salon, "Odobreno", startDate, endDate)
        def sum = 0

        appointments.each { appointment ->
            def usluge = AppointmentService.findAllByAppointment(appointment)?.service
            usluge.each { usluga ->
                sum += usluga.cijenaUsluge
            }

        }
        data += ["Mjesec": month, "Zarada": sum]
        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_USER")
    def findNewestSalons() {
        def now = new Date()

        def salons = Salon.findAllByDateCreatedBetween((now - 7).clearTime(), now.clearTime() + 1)

        def data = []

        salons.each { salon ->
            data += [nazivSalona: salon.nazivSalona,
                     grad       : salon.grad.ime,
                     id         : salon.id,
                     ulica      : salon.ulica,
                     tip        : salon.tipSalona.naziv,
                     status     : salon.isActive
            ]
        }


        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_USER")
    def findImageForSalon() {
        def salon = Salon.get(params.id as Long)
        def images = []

        images = ImageSalon.findAllBySalon(salon)?.image

        render([success: true, data: images] as JSON)
    }

    @Secured("ROLE_USER")
    def findMostVisitedSalons() {
        def max = 0
        def user = springSecurityService.currentUser
        def salons = Salon.findAll()

        def data = []
        salons.each { salon ->
            def countAppointments = Appointment.countBySalonAndUser(salon, user)
            if (max < countAppointments) {
                max = countAppointments
                if (max >= 3) {
                    data += [nazivSalona: salon.nazivSalona,
                             grad       : salon.grad.ime,
                             ulica      : salon.ulica,
                             id         : salon.id,
                             tip        : salon.tipSalona.naziv,
                             status     : salon.isActive
                    ]
                }

            }
        }


        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_USER")
    def searchByName() {
        def input = params.input

        def salons = Salon.findAllByNazivSalonaIlikeAndIsActive("%$input%", true)
        def data = []
        salons.each { salon ->
            data += [salon.id]
        }
        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_USER")
    def searchPage() {

        render(view: '/searchPage')
    }

    @Secured("ROLE_USER")
    def getSalonsByName() {
        def slurper = new groovy.json.JsonSlurper()
        def dataId = slurper.parseText(params.data)

        def data = []
        dataId.each { id ->
            def salon = Salon.get(id as Long)

            if (salon) {

                data += [nazivSalona : salon.nazivSalona,
                         id          : salon.id,
                         grad        : salon.grad.ime,
                         ulica       : salon.ulica,
                         radniDani   : salon.radniDani,
                         radnoVrijeme: salon.radnoVrijeme]
            }
        }
        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_USER")
    def getServicesForSalon() {
        def salon = Salon.get(params.id as Long)

        def usluge = SalonUsluge.findAllBySalon(salon)?.usluge

        def data = []

        usluge.each { usluga ->
            data += [nazivUsluge: usluga.nazivUsluge, cijenaUsluge: usluga.cijenaUsluge]
        }
        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_USER")
    def findSalonsByService() {
        def nazivUsluge = params.usluga

        def usluge = Usluge.findAllByNazivUslugeIlike("%$nazivUsluge%")
        def data = []

        usluge.each { usluga ->
            def salons = SalonUsluge.findAllByUsluge(usluga)?.salon
            salons.each { salon ->
                data += [salon.id]
            }
        }

        render([success: true, data: data] as JSON)
    }

}


