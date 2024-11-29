package sredime

class Image {

    byte[] image
    String imageType
    String imageName
//  String mimeType
    static constraints = {
        image maxSize: 1073741824
    }
}
