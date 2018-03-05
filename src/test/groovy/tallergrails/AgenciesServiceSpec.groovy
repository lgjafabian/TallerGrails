package tallergrails

import grails.test.hibernate.HibernateSpec
import grails.testing.services.ServiceUnitTest

class AgenciesServiceSpec extends HibernateSpec implements ServiceUnitTest<AgenciesService> {

    def setup() {
    }

    void "test get payment methods"() {
        expect:
        service.getPaymentMethods() != null
    }
}
