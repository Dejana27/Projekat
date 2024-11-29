package sredime

import sredime.auth.User

class Zaposleni {

    String ime
    String prezime
    String jmbg
    Salon salon
    String radnoVrijeme
    Integer pocetakRadnoVrijeme
    Integer krajRadnoVrijeme
    String brojTelefona
    User zaposleniUser
    Date  dateCreated
    Date lastUpdated
    Boolean isActive = true

    static constraints = {

    }
}
