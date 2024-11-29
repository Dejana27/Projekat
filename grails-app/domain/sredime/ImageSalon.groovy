package sredime

class ImageSalon {

    Image image
    Salon salon

    Date  dateCreated = new Date()
    Date lastUpdated = new Date()
    static constraints = {
        image maxSize: 1073741824
    }
}
