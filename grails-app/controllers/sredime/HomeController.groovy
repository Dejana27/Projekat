package sredime

import com.fasterxml.jackson.annotation.JsonCreator
import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import sredime.auth.User

import java.text.SimpleDateFormat
import java.util.ArrayList
import java.time.LocalDate
import java.time.LocalTime
import java.sql.Date

@Transactional
@Secured('ROLE_USER')
class HomeController {

    def springSecurityService

    def index() {

        render view: '/home'
    }

    def newTest() {

        render view: '/newTest'
    }


    @Secured('ROLE_USER')
    def showAllCosmeticsSalons() {

//        def tipSalona = TipSalona.get(params.type as Long)
//        def salon = Salon.findAllByTipSalona(tipSalona)


        render(view: '/cosmeticSalon', model: [type: params.type])

    }

    def showAllSalonsByCity() {

        render(view: '/city', model: [id: params.id])
    }

    def showSalonById() {
        def salon = Salon.get(params.id as Long)

        render(view: '/appointment', model: [id       : params.id, ime: salon.nazivSalona, radnoVrijeme: salon.radnoVrijeme, radniDani: salon.radniDani,
                                             tipSalona: salon.tipSalona.naziv, grad: salon.grad.ime, ulica: salon.ulica, tip: salon.tipSalona.id])
    }

    def getDataForSalon() {
        def salon = Salon.get(params.id as Long)
        if (!salon) {
            render(status: 404, text: 'Salon nije pronađen.')
            return
        }
        render(view: '/makeAppointments', model: [id          : params.id,
                                                  ime         : salon.nazivSalona,
                                                  radnoVrijeme: salon.radnoVrijeme,
                                                  radniDani   : salon.radniDani,
                                                  tipSalona   : salon.tipSalona.naziv,
                                                  grad        : salon.grad.ime,
                                                  ulica       : salon.ulica,
                                                  tip         : salon.tipSalona.id])
    }

    def showSalonByType() {
        def salon = Salon.get(params.id as Long)

        render(view: '/appointment', model: [id          : params.id,
                                             ime         : salon.nazivSalona,
                                             radnoVrijeme: salon.radnoVrijeme,
                                             radniDani   : salon.radniDani,
                                             tipSalona   : salon.tipSalona.naziv,
                                             grad        : salon.grad.ime,
                                             ulica       : salon.ulica,
                                             tip         : salon.tipSalona.id])

    }

    //zakazivanje termina
    def makeAppointment() {
        def user = springSecurityService.currentUser
        def salon = Salon.get(params.idSalon as Long)
        def time = params.time as Integer
        def zaposleni = Zaposleni.get(params.zaposleni as Long)

        def stringDate = params.date
        def parsedDate = Date.parse("yyyy-MM-dd", stringDate)
        def slurper = new groovy.json.JsonSlurper()
        def dataId = slurper.parseText(params.data)

        def today = new java.util.Date()
        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy")
        String datum = DATE_FORMAT.format(today)

        SimpleDateFormat date_format = new SimpleDateFormat("dd-MM-yyyy")
        String datum1 = date_format.format(parsedDate)

        def day = datum.substring(0, 2) as Integer
        def day1 = datum1.substring(0, 2) as Integer

        def month = datum.substring(3, 5) as Integer
        def month1 = datum1.substring(3, 5) as Integer
        def parsedDate1 = Date.parse("dd-MM-yyyy", datum1)

        SimpleDateFormat timeNowFormat = new SimpleDateFormat("HH:mm:ss")
        def timeNow = timeNowFormat.format(today)
        def now = timeNow.substring(0, 2) as Integer

        if (!salon || !zaposleni || !user) {
            render([success: false, message: "Salon, zaposleni ili korisnik nisu pronađeni."] as JSON)
            return
        }

        def appointment = new Appointment()
        if ((time >= now + 2 && day1 == day && month1 == month) || day1 != day || (day1 == day && month1 != month)) {

            appointment.user = user
            appointment.salon = salon
            appointment.time = time
            appointment.zaposleni = zaposleni
            if ((day1 < day && month1 == month) || (month1 < month)) {
                render([success: false] as JSON)
            } else {
                appointment.date = parsedDate1
            }

            appointment.status = 'Na čekanju'
            appointment.save()
        } else {
            render([success: false, mesaage: "Nije moguće zakazati termin samo dva sata ranije."] as JSON)
        }


        if (!appointment.save()) {
            render([success: false, message: "Greška prilikom kreiranja termina."] as JSON)
            return
        }

        def services = ZaposleniUsluge.findAllByZaposleni(zaposleni)?.usluge

        def usluge = []

        def ids = []

        services.each { service ->
            ids += [service.id]
        }

        dataId.each { id ->

            def usluga = Usluge.get(id as Long)
//            println id.getClass()
//            println ids.getClass()
            if (usluga) {

                def appointmentServices = new AppointmentService()

                if (ids.contains(id as Long)) {
                    appointmentServices.appointment = appointment
                    appointmentServices.service = usluga
                    appointmentServices.save()

                } else {
                    render([success: false, message: "Greška prilikom kreiranja termina. Zaposleni ne obavlja tu uslugu."] as JSON)
                }

            }


        }
        //istu provjeru treba ovdje napraviti odnosno da kad odabere neko vrijeme koje nije minimum 2 sata kasnije od trenutnog
        //izbaci gresku kao nemogucu opciju
        int numberOfServices = dataId.size()
        for (int i = 1; i < numberOfServices; i++) {
            def additionalAppointment = new Appointment()
            if ((time >= now + 2 && day1 == day && month1 == month) || day1 != day || (day1 == day && month1 != month)) {
                additionalAppointment.user = user
                additionalAppointment.salon = salon
                additionalAppointment.time = time + i
                additionalAppointment.zaposleni = zaposleni
                additionalAppointment.status = 'Na čekanju'

                def usluga = Usluge.get(dataId[i] as Long)
                if (usluga) {
                    if (ids.contains(dataId[i] as Long)) {
                        def appointmentService = new AppointmentService()
                        appointmentService.appointment = additionalAppointment
                        appointmentService.service = usluga
                        appointmentService.save()

                    } else {
                        render([success: false, message: "Greška prilikom kreiranja termina. Zaposleni ne obavlja tu uslugu."] as JSON)
                    }

                }
            }
            if ((day1 < day && month1 == month) || (month1 < month)) {
                render([success: false] as JSON)
            } else {
                additionalAppointment.date = parsedDate1
            }

            additionalAppointment.save()
        }

        def notification = new Notification()
        notification.appointment = appointment
        notification.salon = salon
        notification.save()

        render([success: true, id: appointment.id] as JSON)

    }


    def getDataSalonForAppointment() {

    }

    @Secured("ROLE_SALON")
    def displayAppointmentView() {
        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)
        if (salon) {
            render(view: '../appointmentView', model: [idSalon: salon.id, nazivSalona: salon.nazivSalona, tipSalona: salon.tipSalona.naziv])
        } else {
            render([success: false] as JSON)
        }
    }

    def displayAllAppointments() {
        def user = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(user)
        def appointments = Appointment.findAllBySalon(salon)
        def data = []

        appointments.each { appointment ->
            def services = AppointmentService.findAllByAppointment(appointment)?.service
            services.each {
                service ->
                    data += [Korisnik           : appointment.user.username,
                             Salon              : appointment.salon.nazivSalona,
                             "Zaposleni ime"    : appointment.zaposleni.ime,
                             "Zaposleni prezime": appointment.zaposleni.prezime,
                             "Vrijeme termina"  : appointment.time,
                             Status             : appointment.status,
                             Datum              : appointment.date.toString().substring(0, 10),
                             Usluga             : service.nazivUsluge,
                             id                 : appointment.id,
                             "Odobri"           : "",
                             "Odbij"            : ""
                    ]
            }

        }
        render([success: true, data: data] as JSON)
    }

    def getAppointmentData() {

    }

    def appointmentApproved() {
        def appointmentId = params.id as Long
        def appointment = Appointment.get(appointmentId as Long)

        def status = appointment.status //na cekanju, odobreno, odbijeno

        status = "Odobreno"

        appointment.status = status
        render([success: true] as JSON)
    }

    def appointmentRejected() {
        def appointmentId = params.id as Long
        def appointment = Appointment.get(appointmentId as Long)

        def status = appointment.status

        status = "Odbijeno"

        appointment.status = status

        def data = []
        data = [vrijeme: appointment.time, status: appointment.status, datum: appointment.date]
        //potrebno je da ovdje obrisem appointment nakon sto ga odbijem - odnosno da obrisem vezu izmedju notifikacije i termina, i vezu izmedju
        //usluge i termina ili nekako ako vidim da je status odbijeno da oslobodim vrijeme za odbijeni appointment - ovo je cak idealno
        //ako je moguce uopste
//        def appointmentServices = AppointmentService.findAllByAppointment(appointment)
//        appointmentServices.each {appointmentService ->
//            appointmentService.delete(flush: true)
//        }
//
////        def appointmentNotifications = Notification.findAllByAppointment(appointment)
////        appointmentNotifications.each { appointmentNotification ->
////            appointmentNotification.delete(flush: true)
////        }
//
//        appointment.delete(flush: true);

        render([success: true, data: data] as JSON)
    }

    def getTime() {
        def date = params.date

        def stringDate = date ? Date.parse("yyyy-MM-dd", date) : null


        def appointment = Appointment.findAllBySalonAndDate(Salon.get(params.id), stringDate);
        def data = []

        appointment.each { a ->
            data += [vrijeme: a.time, salon: a.salon, korisnik: a.user, status: a.status]
        }
        render([success: true, data: data] as JSON)
    }

    def showCityName() {
        def grad = Grad.get(params.idCity as Long)

        render([success: true, name: grad.ime] as JSON)
    }

    def showAllSalonsType() {

        def tipSalona = TipSalona.get(params.type as Long)
        def salon = Salon.findAllByTipSalona(tipSalona)
        def salonImage = ImageSalon.findAllBySalon(salon)
        def usluge = SalonUsluge.findAllBySalon(salon)

        render([success: true, data: salon, image: salonImage, services: usluge] as JSON)
    }

    def showAllServicesForSalon() {

        def salon = Salon.get(params.id as Long)
        if (salon) {
            def usluge = SalonUsluge.findAllBySalon(salon)?.usluge
            render([success: true, data: usluge] as JSON)
        } else {
            render([success: false, error: 'Salon nije nađen.'] as JSON)
        }
    }

    @Secured('ROLE_USER')
    def showAllImagesForSalon() {

        def salonId = params.id as Long
        def salon = Salon.get(salonId)
        def images = []

        if (salon) {
            images = ImageSalon.findAllBySalon(salon)?.image
        }

        render([success: true, data: images] as JSON)
    }

    @Secured('ROLE_USER')
    def showAllImagesForSalonByCity() {
        def salonId = params.salonId as Long
        def salon = Salon.get(salonId)
        def images = []

        if (salon) {
            images = ImageSalon.findAllBySalon(salon)?.image
        }

        render([success: true, data: images] as JSON)

    }

    @Secured('ROLE_USER')
    def showCity() {

        def grad = Grad.findByIme(params.name);

        render([success: true, data: grad] as JSON)
    }

    def showAllSalonsAndServicesByCity() {

        def grad = Grad.get(params.idCity as Long)

        def salons = Salon.findAllByGrad(grad)

        render([success: true, data: salons] as JSON)
    }


    def getDataAboutProfile() {
        def user = springSecurityService.currentUser

        def username = user.username
        def email = user.email

        def data = [username: username, email: email, id: user.id]
        render([success: true, data: data] as JSON)
    }

    def saveUpdatedUser() {

        def username = params.username
        def email = params.email
        def password = params.password

        def user = springSecurityService.currentUser
        user.username = username
        user.email = email
        user.password = password
        user.save()

        render([success: true] as JSON)
    }

    def deleteUser() {

        def user = User.get(params.id as Long)
        user.enabled = false

        user.save()
        render([success: true] as JSON)
    }

    def getName() {
        def user = springSecurityService.currentUser

        render([success: true, name: user.name] as JSON)
    }

    def getSalonData() {
        def salon = Salon.get(params.id as Long)
        def usluge = SalonUsluge.findAllBySalon(salon)?.usluge


        render([success: true] as JSON)
    }

    def getServicesAndPrices() {
        def salon = Salon.get(params.id as Long)
        def usluge = SalonUsluge.findAllBySalon(salon)?.usluge

        def data = []
        usluge.each { usluga ->
            data += [ime: usluga.nazivUsluge, id: usluga.id, cijena: usluga.cijenaUsluge]
        }

        render([success: true, data: data] as JSON)
    }

    def getWorkDaysAndHours() {

        def salon = Salon.get(params.id as Long)
        def radniDani = salon.radniDani
        def radnoVrijeme = salon.radnoVrijeme
        def zaposleni = Zaposleni.findAllBySalon(salon)

        def dataZaposleni = []
        def uslugeData = []
        zaposleni.each { z ->
            def usluge = ZaposleniUsluge.findAllByZaposleni(z)?.usluge
            uslugeData = []
            usluge.each { usluga ->
                uslugeData += [nazivUsluge: usluga.nazivUsluge]

            }
            dataZaposleni += [zaposleniIme: z.ime, zaposleniPrezime: z.prezime, usluge: uslugeData]
        }

        def data = [radniDani: radniDani, radnoVrijeme: radnoVrijeme]

        render([success: true, data: data, dataZaposleni: dataZaposleni] as JSON)
    }

    def getServiceType() {

        def salon = Salon.get(params.id as Long)
        def usluge = SalonUsluge.findAllBySalon(salon)?.usluge

        def tipUsluge = []

        usluge.each { usluga ->
            if (!tipUsluge.contains(usluga.tipUsluge.nazivUsluge)) {
                tipUsluge.add(usluga.tipUsluge.nazivUsluge)
            }
        }
        render([success: true, data: tipUsluge] as JSON)

    }

    def getSalonDataByType() {
        def salon = Salon.get(params.id as Long)
        def usluge = SalonUsluge.findAllBySalon(salon)?.usluge

        render([success: true] as JSON)
    }

    def saveLikedSalons() {
        def salon = Salon.get(params.id as Long)
        def user = springSecurityService.currentUser

        def likedSalon = new LikedSalons()
        likedSalon.salon = salon
        likedSalon.korisnik = user
        likedSalon.liked = true

        likedSalon.save()

        render([success: true] as JSON)
    }

    def deleteLikedSalon() {
        def salon = Salon.get(params.id as Long)
        def likedSalon = LikedSalons.findBySalon(salon)

        //  def user = likedSalon.korisnik

        likedSalon.delete(flush: true)

        render([success: true] as JSON)

    }

    def isLiked() {
        def salon = Salon.get(params.id as Long)
        def user = springSecurityService.currentUser

        def likedSalon = LikedSalons.findByKorisnikAndSalon(user, salon)
        def isLiked = likedSalon?.liked ?: false


        render([success: true, isLiked: isLiked] as JSON)
    }

    def showLikedSalons() {
        render view: '/likedSalon'
    }

    def showLikedLookBooks() {
        render view: '/likedLookBooks'
    }

    def showAllLikedSalons() {
        def user = springSecurityService.currentUser
        def likedSalons = LikedSalons.findAllByKorisnik(user)

        def data = []

        likedSalons.each { likedSalon ->
            data += [nazivSalona: likedSalon.salon.nazivSalona, id: likedSalon.salon.id, adresa: likedSalon.salon.ulica]
        }
        render([success: true, data: data] as JSON)
    }

    def showImage() {
        def salon = Salon.get(params.id as Long)
        def images = []

        images = ImageSalon.findAllBySalon(salon)?.image

        render([success: true, data: images] as JSON)
    }

    def showLikedSalon() {

        render view: '/appointment'
    }

    def getDataLikedSalon() {
        def salon = Salon.get(params.id as Long)
        render(view: '/likedSalon', model: [id       : params.id, ime: salon.nazivSalona, radnoVrijeme: salon.radnoVrijeme, radniDani: salon.radniDani,
                                            tipSalona: salon.tipSalona.naziv, grad: salon.grad.ime, ulica: salon.ulica, tip: salon.tipSalona.id]);
    }

    def showAppointmentsForNextWeek() {
        render view: '/appointmentsNextWeek'
    }

    def showAppointmentsForPreviousWeek() {
        render view: '/appointmentsPreviousWeek'
    }

    def showAllHairstyles() {
        render view: '/showAllHairstyles'
    }

    def showHairstyles() {
        render view: '/showHairstyles'
    }

    def showNailsInspo() {
        render view: '/showNailsInspo'
    }

    def showBalayage() {
        render view: '/showBalayage'
    }

    def showWorkHours() {
        def salon = Salon.get(params.id as Long)
        def date = params.date

        if (!salon) {
            render([success: false, message: "Salon nije pronađen."] as JSON)
            return
        } else {

        }
        def radnoVrijemePocetak = salon.pocetak
        def radnoVrijemeKraj = salon.kraj
//        def datum = date
        def data = [pocetak: radnoVrijemePocetak, kraj: radnoVrijemeKraj]
        render([success: true, data: data] as JSON)
    }

    def showEmployees() {

        def salon = Salon.get(params.id as Long)
        if (!salon) {
            render([success: false, message: "Salon nije pronađen."] as JSON)
            return
        }

        def employees = Zaposleni.findAllBySalon(salon)
        def data = []
        employees.each { employee ->
            data += [ime: employee.ime, prezime: employee.prezime, brojTelefona: employee.brojTelefona, id: employee.id]
        }

        render([success: true, data: data] as JSON)
    }

    def appointmentChecked() {

        render view: '/appointmentChecked'
    }
}

