package sredime

class Notification {
    Appointment appointment
    Salon salon
    Date dateCreated = new Date()
    Date lastUpdated = new Date()

    static constraints = {
    }
}


//def odobriOdbijAppointment() {
//    def appointmentId = params.appointmentId as Long
//    def status = params.status // "approved" or "rejected"
//
//    if (!["approved", "rejected"].contains(status)) {
//        render([success: false, message: "Invalid status"] as JSON)
//        return
//    }
//
//    def appointment = Appointment.get(appointmentId)
//    if (!appointment) {
//        render([success: false, message: "Appointment not found"] as JSON)
//        return
//    }
//
//    appointment.status = status
//    if (!appointment.save(flush: true)) {
//        render([success: false, message: "Failed to update appointment status"] as JSON)
//        return
//    }
//
//    render([success: true, appointmentId: appointment.id, status: appointment.status] as JSON)
//}