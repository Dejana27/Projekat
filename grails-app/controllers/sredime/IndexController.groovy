package sredime

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
@Transactional
class IndexController {

    def index() {
        render view: "index.gsp"
    }
}
