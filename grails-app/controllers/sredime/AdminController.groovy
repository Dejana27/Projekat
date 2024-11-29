package sredime

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional
@Secured("ROLE_ADMIN")
class AdminController {

    def index() {
        render  view: "../admin"
    }
    def showReports () {
        render view: "/report"
    }
    def displayAllSalons () {
        def salons = Salon.findAll()
        def data = []

        salons.each {salon ->
                data+= [nazivSalona: salon.nazivSalona, id: salon.id]
            }
        render([success: true, data: data] as JSON)
        }


     def findPricesAndEarnings () {
         def salon = Salon.get(params.id as Long)
         def appointments = Appointment.findAllBySalon(salon)
         def earnings = []
         def data = []
         appointments.each {appointment ->
             def services = AppointmentService.findAllByAppointment(appointment)?.service
             services.each {service ->
                 earnings += [sum: service.cijenaUsluge]
             }

         }

         render([success: true, data: earnings, nazivSalona: salon.nazivSalona] as JSON)
     }

}
