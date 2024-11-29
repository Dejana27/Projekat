package sredime

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.MultipartFile

@Secured('ROLE_SALON')
class TestController {

    def index() {
        def salon = Salon.get(params.id as Long)

        def data = []

        data = [nazivSalona: salon.nazivSalona]

        render([success: true, data: data] as JSON)
    }
    @Secured('ROLE_SALON')
    def uploadFile () {

        def uploadedFiles = [];
        params.files.each{ file ->

            uploadedFiles.add(file);
        }

        render uploadedFiles as JSON;
    }
}
