package sredime

import grails.gorm.transactions.Transactional
import sredime.auth.Role
import sredime.auth.User
import sredime.auth.UserRole

@Transactional
class GeneralService {

    def bootstrapInit() {
        def adminRole = "ROLE_ADMIN"
        def userRole = "ROLE_USER"
        def employeeRole = "ROLE_EMPLOYEE"
        def salonRole = "ROLE_SALON"

        def roleAdmin = Role.findByAuthority(adminRole) ?:  new Role(authority: adminRole).save(flush: true, failOnError: true)

        def roleUser = Role.findByAuthority(userRole)?: new Role(authority: userRole).save(flush: true, failOnError: true)

        def roleEmployee = Role.findByAuthority(employeeRole)?: new Role(authority: employeeRole).save(flush: true, failOnError: true)

        def roleSalon = Role.findByAuthority(salonRole)?: new Role(authority: salonRole).save(flush: true, failOnError: true)

        def admin = User.findByUsername('admin') ?: new User(name:'Dejana', username: 'admin', password: 'admin123!', email: 'dejanavukcevic@gmail.com').save(flush: true, failOnError: true)

        if(!UserRole.findByUserAndRole(admin, roleAdmin)) {
            UserRole.create(admin, roleAdmin)
        }

        def userTest = User.findByUsername('test')?: new User(name:'Zorica', username: 'test', password: 'test123#', email: 'zoricavukcevic@gmail.com').save(flush: true, failOnError: true)

        if(!UserRole.findByUserAndRole(userTest, roleUser)){
            UserRole.create(userTest, roleUser)
        }

        def zaposleniTest = User.findByUsername('zaposleniTest')?: new User(name: 'Dragana', username: 'zaposleniTest', password: 'zaposleni123!', email: 'draganamiladinovic@gmail.com').save(flush: true, failOnError: true)

        if(!UserRole.findByUserAndRole(zaposleniTest, roleEmployee)) {
            UserRole.create(zaposleniTest, roleEmployee)
        }

        def salonTest = User.findByUsername('salonTest')?: new User(name: 'Gracija', username: 'salonTest', password: 'salon123!', email: 'gracija@gmail.com').save(flush: true, failOnError: true)

        if(!UserRole.findByUserAndRole(salonTest, roleSalon)) {
            UserRole.create(salonTest, roleSalon)
        }

    }
    def serviceMethod() {

    }
}
