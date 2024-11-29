package sredime

import grails.gorm.transactions.Transactional
import net.coobird.thumbnailator.Thumbnails
import org.springframework.web.multipart.MultipartFile
@Transactional
class ImageResizeService {

    /**
     * Resizes an image to the specified width and height.
     *
     * @param imageFile The image file to resize
     * @param width The desired width
     * @param height The desired height
     * @return The resized image as a byte array
     */
//    byte[] resizeImage(MultipartFile imageFile, int width, int height) {
//        ByteArrayOutputStream outputStream = new ByteArrayOutputStream()
//
//        Thumbnails.of(imageFile.inputStream)
//                .size(width, height)
//                .toOutputStream(outputStream)
//
//        return outputStream.toByteArray()
//    }
}
