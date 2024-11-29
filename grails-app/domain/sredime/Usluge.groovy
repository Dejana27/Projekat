package sredime

class Usluge {

    String nazivUsluge
    Float cijenaUsluge
    Date dateCreated = new Date()
    Date lastUpdated = new Date()
    TipUsluge tipUsluge
    Boolean isActive = true

    static constraints = {

    }
}
