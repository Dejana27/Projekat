package sredime

import sredime.auth.User

class Salon {

    String nazivSalona
    String radnoVrijeme
    String radniDani
    Integer pocetak
    Integer kraj
    TipSalona tipSalona
    Boolean  isActive = true
    Boolean isVerified = false
    User salonUser
    Grad grad
    String ulica
    Date dateCreated
    Date lastUpdated

    static constraints = {
        radnoVrijeme maxSize: 15, nullable: true
        grad maxSize: 20, nullable: false
        ulica maxSize: 50, nullable: false
        nazivSalona maxSize: 50, nullable: false
        tipSalona nullable: true
        isActive nullable: true
        isVerified nullable: true
        salonUser nullable: false
        radniDani nullable: true
        dateCreated nullable: true
        lastUpdated nullable: true
    }
}
