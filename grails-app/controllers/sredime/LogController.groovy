package sredime

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class LogController {

    LogService logService


}

//    @Secured('ROLE_SALON')
//    def getBudgetForMonth(String month) {
//
////        // Pretpostavka: postoji model `Transaction` koji sadrži podatke o zaradama
////        def startDate = Date.parse("yyyy-MM", month)
////        def endDate = startDate.clone()
////        endDate[Calendar.MONTH] += 1
////
////        def transactions = Transaction.findAllBySalonAndDateBetween(salon, startDate, endDate)
////        def totalEarnings = transactions.sum { it.amount } ?: 0
//
//        render ([success: true, totalEarnings: totalEarnings] as JSON)
//    }