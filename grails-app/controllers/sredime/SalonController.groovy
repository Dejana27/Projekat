package sredime

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile
import sredime.auth.Role
import sredime.auth.User
import sredime.auth.UserRole

import java.sql.Date
import java.text.SimpleDateFormat


@Transactional
@Secured("permitAll")
class SalonController {

    def springSecurityService

    @Secured("ROLE_ADMIN")
    def index() {
        render view: '../salon'
    }

    @Secured("ROLE_ADMIN")
    def showUsers() {
        render view: '/users'
    }

    @Secured("ROLE_SALON")
    def show() {
        render view: '../salonIndex'
    }

    @Secured('ROLE_ADMIN')
    def typeSalon() {
        new TipSalona(naziv: 'Ženski frizerski salon').save()
        new TipSalona(naziv: 'Kozmetički salon').save()
        new TipSalona(naziv: 'Muški frizerski salon').save()
        new TipSalona(naziv: 'Salon za nokte').save()
        new TipSalona(naziv: 'Estetski centar / klinika').save()
        new TipSalona(naziv: 'SPA').save()
    }

    @Secured('permitAll')
    def displaySalon() {
        def type = TipSalona.list();
        def data = []

        type.each { t ->
            data += [naziv: t.naziv,
                     id   : t.id]
        }
        render([success: true, salon: data] as JSON)
    }

    @Secured('ROLE_ADMIN')
    def displayAll() {
        def salon = Salon.findAllByIsActive(true)
        def data = []

        salon.each { s ->
            data += [Naziv        : s.nazivSalona, Grad: s.grad.ime,
                     Ulica        : s.ulica, Korisnik: s.salonUser.username,
                     id           : s.id, userId: s.salonUser.id, Tip: s.tipSalona.naziv,
                     "Verifikovan": s.isVerified,
                     "Aktivan"    : s.isActive,
                     "Detalji"    : "",
                     "Izmjena"    : "",
                     "Brisanje"   : " ",
                     "Izvještaj"  : ""]
        }
        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_ADMIN')
    @Transactional
    def deleteSalon() {
        def salon = Salon.get(params.userId as Long)

        SalonUsluge.findAllBySalon(salon).each { salonUsluga ->
            def usluga = salonUsluga.usluge
            ZaposleniUsluge.findAllByUsluge(usluga).each { zaposleniUsluga ->
                zaposleniUsluga.delete(flush: true)
            }
            AppointmentService.findAllByService(usluga).each { appointmentService ->
                appointmentService.delete(flush: true)
            }
            salonUsluga.delete(flush: true)
            usluga?.delete(flush: true)
        }

        ImageSalon.findAllBySalon(salon).each { imageSalon ->
            def image = imageSalon.image

            imageSalon.delete(flush: true)
            image?.delete(flush: true)
        }

        if (salon) {
            salon.isActive = false
            salon.save()
        }

        def user = salon.salonUser
        user.enabled = false
        user.save()

        render([success: true] as JSON)
    }

    @Secured('ROLE_SALON')
    def editSalon() {
        def salon = Salon.get(params.id as Long)

        def data = [nazivSalona: salon.nazivSalona, grad: salon.grad.id, radnoVrijeme: salon.radnoVrijeme, radniDani: salon.radniDani, tipSalona: salon.tipSalona.id]

        render([success: true, data: data] as JSON)
    }

    @Secured('permitAll')
    def saveSalon() {
        def salon = Salon.get(params.idSalon as Long)

        salon.nazivSalona = params.nazivSalona
        salon.radnoVrijeme = params.radnoVrijeme
        salon.radniDani = params.radniDani
        salon.grad = Grad.get(params.gradId as Long)
        salon.tipSalona = TipSalona.get(params.typeSalonId as Long)
        salon.save()

        render([success: true] as JSON)
    }

    @Secured("ROLE_SALON")
    def showSalon() {
        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)

        if (salon) {
            render(view: '../test', model: [idSalon: salon.id, nazivSalona: salon.nazivSalona, tipSalona: salon.tipSalona.naziv])
        } else {
            render([success: false] as JSON)
        }

    }

    def addPhotoView () {
        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)

        if (salon) {
            render(view: '../addPhoto', model: [idSalon: salon.id, nazivSalona: salon.nazivSalona, tipSalona: salon.tipSalona.naziv])
        } else {
            render([success: false] as JSON)
        }
    }
    @Secured('ROLE_ADMIN')
    def editVerification() {


        def salon = Salon.get(params.id as Long)
        def user = salon.salonUser
        def status = salon.isVerified


        def data = []

        salon.isVerified = !status
        if (salon.isVerified) {
            salon.salonUser.enabled = true;
        } else {
            salon.salonUser.enabled = false;
        }
        salon.save()

        render([success: true] as JSON)
    }

    @Secured('permitAll')
    def displaySalons() {

        def salon = Salon.list();
        def data = []

        salon.each { s ->
            data += [nazivSalona: s.nazivSalona, id: s.id]
        }

        render([success: true, salon: data] as JSON)
    }

    @Secured('ROLE_ADMIN')
    def showVerifiedSalons() {
        def salons = Salon.findAllByIsVerified(true)
        def data = []

        salons.each { salon ->
            data += [Naziv    : salon.nazivSalona, Grad: salon.grad.ime, Ulica: salon.ulica, Korisnik: salon.salonUser.username, id: salon.id, userId: salon.salonUser.id, Tip: salon.tipSalona.naziv, "Verifikovan": salon.isVerified, "Aktivan": salon.isActive,
                     "Detalji": "", "Izmjena": "", "Brisanje": " ", "Izvještaj": ""]
        }
        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_ADMIN')
    def showUnverifiedSalons() {
        def salons = Salon.findAllByIsVerified(false)
        def data = []

        salons.each { salon ->
            data += [Naziv    : salon.nazivSalona, Grad: salon.grad.ime, Ulica: salon.ulica, Korisnik: salon.salonUser.username, id: salon.id, userId: salon.salonUser.id, Tip: salon.tipSalona.naziv, "Verifikovan": salon.isVerified, "Aktivan": salon.isActive,
                     "Detalji": "", "Izmjena": "", "Brisanje": " ", "Izvještaj": ""]
        }

        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_SALON")
    def zaposleniIndex() {
        render view: '../zaposleni'
    }

    @Secured("ROLE_SALON")
    def showDetails() {
        def salon = Salon.get(params.id as Long)

        def sviZaposleni = Zaposleni.findAllBySalon(salon)

        def data = []

        def zaposleni = []

        sviZaposleni.each { z ->

            zaposleni += [ime: z.ime, prezime: z.prezime, radnoVrijeme: z.radnoVrijeme, brojTelefona: z.brojTelefona]
        }

        data = [nazivSalona: salon.nazivSalona, Grad: salon.grad.ime, Ulica: salon.ulica, id: salon.id, Tip: salon.tipSalona.naziv, Zaposleni: zaposleni, Verifikovan: salon.isVerified]


        render([success: true, data: data] as JSON)
    }

    @Secured("ROLE_SALON")
    def saveImage() {

        def imageSalon = new ImageSalon()
        imageSalon.salon = Salon.findBySalonUser(springSecurityService.currentUser)


        def imageFile = params.imageFile

        imageFile.each { f ->
            MultipartFile mfile = f
            String imageName = mfile?.originalFilename
            String extension = imageName?.tokenize('.')?.last()

            def image = new Image()
            image.image = mfile.getBytes()
            image.imageName = imageName
            image.imageType = extension
            imageSalon.image = image
            imageSalon.save()
        }
        render([success: true] as JSON)
    }

    @Secured("ROLE_ADMIN")
    def showAllUsers() {
        def role = Role.findByAuthority('ROLE_USER')
        def users = UserRole.findAllByRole(role)?.user
        def data = []

        users.each { user ->
            data += [Ime: user.name, "Korisničko ime": user.username, email: user.email, "Prikaži podatke": "", id: user.id, "Brisanje": ""]
        }


        render([success: true, data: data] as JSON)
    }

    def showUsersDetail() {
        def user = User.get(params.id as Long)
        def likedSalons = LikedSalons.findAllByKorisnik(user)?.salon
        def appointments = Appointment.findAllByUser(user)
        def appointmentService
        def data = []
        def dataService = []
        appointments.each { a ->
            appointmentService = AppointmentService.findAllByAppointment(a)?.service
            dataService += [nazivUsluge: appointmentService.nazivUsluge]
        }

        data = [ime         : user.name, korisnickoIme: user.username, mejl: user.email, id: user.id, likedSalons: likedSalons,
                appointments: dataService]
        render([success: true, data: data] as JSON)

    }

    def getSumForEachSalon() {

        render([success: true] as JSON)
    }

    @Secured("ROLE_ADMIN")
    def deleteUser() {
        def user = User.get(params.id as Long)

        user.enabled = false

        user.save()
        render([success: true] as JSON)
    }

    def testDatum () {
        def today = new java.util.Date()
        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy")
        String datum = DATE_FORMAT.format(today)

        def day = datum.substring(0,2)
        def month = datum.substring(3,5)

        render([success:true] as JSON)
    }


}

