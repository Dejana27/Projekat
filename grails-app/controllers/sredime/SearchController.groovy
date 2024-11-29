package sredime

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
@Transactional
class SearchController {

    def index() { }

    def show() {
        render view : "../../views/searchPage"
    }
}
