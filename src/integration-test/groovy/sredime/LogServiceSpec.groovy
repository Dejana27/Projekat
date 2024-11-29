package sredime

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class LogServiceSpec extends Specification {

    LogService logService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Log(...).save(flush: true, failOnError: true)
        //new Log(...).save(flush: true, failOnError: true)
        //Log log = new Log(...).save(flush: true, failOnError: true)
        //new Log(...).save(flush: true, failOnError: true)
        //new Log(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //log.id
    }

    void "test get"() {
        setupData()

        expect:
        logService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Log> logList = logService.list(max: 2, offset: 2)

        then:
        logList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        logService.count() == 5
    }

    void "test delete"() {
        Long logId = setupData()

        expect:
        logService.count() == 5

        when:
        logService.delete(logId)
        sessionFactory.currentSession.flush()

        then:
        logService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Log log = new Log()
        logService.save(log)

        then:
        log.id != null
    }
}
