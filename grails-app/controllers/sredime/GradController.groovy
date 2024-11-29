package sredime

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

import javax.swing.GrayFilter

@Transactional
class GradController {

    def index() { }

    @Secured('ROLE_ADMIN')
    def createCity() {
        new Grad(ime: 'Podgorica').save()
        new Grad(ime: 'Bar').save()
        new Grad(ime: 'Kolašin').save()
        new Grad(ime: 'Cetinje').save()
        new Grad(ime: 'Nikšić').save()
        new Grad(ime: 'Tivat').save()
        new Grad(ime: 'Kotor').save()
        new Grad(ime: 'Herceg Novi').save()
        new Grad(ime: 'Žabljak').save()
        new Grad(ime: 'Ulcinj').save()
        new Grad(ime: 'Budva').save()
        new Grad(ime: 'Mojkovac').save()
        new Grad(ime: 'Danilovgrad').save()
        new Grad(ime: 'Pljevlja').save()
        new Grad(ime: 'Bijelo Polje').save()
        new Grad(ime: 'Berane').save()
        new Grad(ime: 'Plav').save()
        new Grad(ime: 'Rožaje').save()
        new Grad(ime: 'Plužine').save()
        new Grad(ime: 'Šavnik').save()
        new Grad(ime: 'Andrijevica').save()

    }

    @Secured('permitAll')
    def createCities() {
        def cities = Grad.list()
        def data = []

        cities.each {city ->
            data += [ime: city.ime, id: city.id]
        }

        render([success : true, cities : data ] as JSON)
    }
}
