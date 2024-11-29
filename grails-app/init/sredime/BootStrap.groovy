package sredime

class BootStrap {

    GeneralService generalService
    def init = { servletContext ->
        generalService.bootstrapInit()
    }
    def destroy = {
    }
}
