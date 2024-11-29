package sredime

import grails.converters.JSON
import grails.gorm.services.Service
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import sredime.auth.User

@Transactional
@Secured('permitAll')
class LogService {
//
//    def saveLog(String naslov, String tekst, User user, Salon salon, Zaposleni zaposleni, String status) {
//
//        def log = new Log(naslov: naslov, tekst: tekst, user: user, salon: salon, zaposleni: zaposleni, status: status)
//        log.save(flush: true, failOnError: true)
//        return ([success:true] as JSON)
//    }
}