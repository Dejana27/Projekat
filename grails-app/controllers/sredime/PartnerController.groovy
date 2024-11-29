package sredime

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured("permitAll")
@Transactional
class PartnerController {

    def index() {
        render view: "../partner/partner"
    }

    def marketing() {
        render view: "../partner/marketing"
    }

    def marketingKlijent() {
        render view: "../partner/marketingKlijenti"
    }

    def registerSalon() {
        render view: "../registracijaSalon"
    }
}
