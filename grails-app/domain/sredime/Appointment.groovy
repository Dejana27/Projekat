package sredime

import sredime.auth.User


class Appointment {

    User user
    Salon salon
    Integer time
    Zaposleni zaposleni
    String status
//    LocalDate date
    //da li da ovdje dodam polje active ? prosto mora da postoji povratna informacija da li je zakazano nesto
    Date date
    static constraints = {
    }


}
