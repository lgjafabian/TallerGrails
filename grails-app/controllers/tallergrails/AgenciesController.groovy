package tallergrails

class AgenciesController {

    AgenciesService agenciesService

    def index() {
        def paymentMethods = agenciesService.getPaymentMethods()
        [payment_methods: paymentMethods]
    }

    def show() {
        def paymentMethod = params.paymentMethod
        def radio = params.radio
        def limit = 10
        def location = agenciesService.getLocation(params)

        if (location == null)
            return null

        def url = "https://api.mercadolibre.com/sites/MLA/payment_methods/${paymentMethod}/agencies?near_to=${location.latitude},${location.longitude},${radio}&limit=${limit}"
        def agencies = agenciesService.getAgencies(url)

        if (agencies == null)
            return null

        [agencies: agencies, centerLat: location.latitude, centerLong: location.longitude]

    }

}
