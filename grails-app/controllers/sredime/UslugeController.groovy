package sredime

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured


@Secured('ROLE_SALON')
@Transactional
class UslugeController {

    def springSecurityService

    def index() {}

    def typeService() {
        new TipUsluge(nazivUsluge: 'Šišanje').save()
        new TipUsluge(nazivUsluge: 'Farbanje').save()
        new TipUsluge(nazivUsluge: 'Manikir').save()
        new TipUsluge(nazivUsluge: 'Masaža').save()
        new TipUsluge(nazivUsluge: 'Pedikir').save()
    }


    @Secured('permitAll')
    def displayService() {
        def services = TipUsluge.list();
        def data = []

        services.each { service ->
            data += [nazivUsluge: service.nazivUsluge, id: service.id]
        }
        render([success: true, services: data] as JSON)
    }

    @Secured('permitAll')
    def createService() {

        def name = params.name
        def price = params.price
        def typeService = TipUsluge.get(params.typeId as Long)

        def usluge = new Usluge()

        usluge.nazivUsluge = name
        usluge.cijenaUsluge = price as Float
        usluge.tipUsluge = typeService

        usluge.save()

        def salonUsluge = new SalonUsluge()
        salonUsluge.salon = Salon.findBySalonUser(springSecurityService.currentUser)
        salonUsluge.usluge = usluge
        salonUsluge.save()

        render([success: true] as JSON)

    }

    @Secured('ROLE_SALON')
    def showService() {
        def salonUser = springSecurityService.currentUser
        def salon = Salon.findBySalonUser(salonUser)

        render (view: '../testServices', model: [idSalon: salon.id, nazivSalona: salon.nazivSalona])
    }

    @Secured("ROLE_SALON")
    def showServices() {

//        def salon = Salon.findBySalonUser(salonUser)
//
//        if(salon){
//            render (view:'../test' , model : [idSalon: salon.id, nazivSalona: salon.nazivSalona])
//        } else {
//            render ([success: false] as JSON)
//        }
        //treba da mi izbaci samo za odredjeni salon
    }

    @Secured('permitAll')
    def displayAll() {
        def usluge = SalonUsluge.findAllBySalon(Salon.findBySalonUser(springSecurityService.currentUser))?.usluge
        def data = []

        usluge.each { usluga ->
            data += [nazivUsluge: usluga.nazivUsluge, cijenaUsluge: usluga.cijenaUsluge, tipUsluge: usluga.tipUsluge.nazivUsluge, id: usluga.id, "Izmjena": "", "Brisanje": " "]
        }

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_SALON')
    def deleteService() {
        def uslugaId = Usluge.get(params.id as Long)
        def salon = Salon.findBySalonUser(springSecurityService.currentUser)
        def zaposleniUsluge = ZaposleniUsluge.findAllByUsluge(uslugaId)
        //brisem vezu izmedju usluge sa svim zaposlenima za koje je vezana ta usluga
        zaposleniUsluge.each {zaposleniUsluga ->
            zaposleniUsluga.delete(flush: true)
        }
        // ovdje ce naci samo odredjenu uslugu tj vezu izmedju salona i te odredjene usluge jer trazim po id
        def salonUsluga = SalonUsluge.findBySalonAndUsluge(salon, uslugaId)

        def usluga = salonUsluga.usluge

        salonUsluga.delete(flush: true)
        usluga.delete(flush: true)

        render([success: true] as JSON)
    }

    @Secured('ROLE_SALON')
    def editService() {
        def usluge = Usluge.get(params.id as Long)

        def data = []

        data = [nazivUsluge: usluge.nazivUsluge, cijenaUsluge: usluge.cijenaUsluge, tipUsluge: usluge.tipUsluge.id]

        render([success: true, data: data] as JSON)
    }

    @Secured('ROLE_SALON')
    def saveService() {
        def usluge = Usluge.get(params.id as Long)

        usluge.nazivUsluge = params.serviceName
        usluge.cijenaUsluge = params.servicePrice as float
        usluge.tipUsluge = TipUsluge.get(params.typeId)
        usluge.save()

        render([success: true] as JSON)

    }

    @Secured('ROLE_SALON')
    def saveTypeOfService() {
        def type = params.type

        def tipUsluge = new TipUsluge()
        tipUsluge.nazivUsluge = type
        tipUsluge.save()

        render([success: true] as JSON)
    }
}
