package sredime

import sredime.auth.User

class LikedSalons {

    Salon salon
    User korisnik
    Date dateCreated = new Date()
    Date lastUpdated = new Date()
    Boolean liked = false

    static constraints = {
    }
}
