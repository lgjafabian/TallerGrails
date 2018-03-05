package tallergrails

import grails.test.hibernate.HibernateSpec
import grails.testing.web.controllers.ControllerUnitTest

class AgenciesControllerSpec extends HibernateSpec implements ControllerUnitTest<AgenciesController> {

    def setup() {
        controller.agenciesService = Mock(AgenciesService)
    }

    def cleanup() {
    }

    void "test index"() {
        when:
        request.method = 'GET'
        request.requestMethod = 'GET'
        controller.index()

        then:
        response.status == 200
    }

    void "test show"() {
        setup:
        params.paymentMethod = "pagofacil"
        params.address = "Colon, 348, Cordoba"
        params.radio = "300"

        when:
        request.method = 'GET'
        request.requestMethod = 'GET'
        controller.show()

        then:
        response.status == 200

    }
}
