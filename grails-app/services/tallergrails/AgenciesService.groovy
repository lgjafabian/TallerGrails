package tallergrails

import grails.gorm.transactions.Transactional
import groovy.json.JsonSlurper

@Transactional
class AgenciesService {

    def getPaymentMethods() {
        def url = new URL("https://api.mercadolibre.com/sites/MLA/payment_methods")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozzilla/5.0")
        JsonSlurper json = new JsonSlurper()
        def paymentMethods = json.parse(connection.getInputStream())
        return paymentMethods
    }

    def getAgencies(String urlString) {
        def url = new URL(urlString)
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozzilla/5.0")
        JsonSlurper json = new JsonSlurper()

        if (connection.getResponseCode() == 400) {
            println("Could not get Agencies - BAD REQUEST - 400")
            return null
        } else {
            def agencies = json.parse(connection.getInputStream()).results
            return agencies
        }
    }

    def getLocation(par) {
        def address = par.address
        def encoded = URLEncoder.encode(address, "UTF-8")
        def key = "AIzaSyAe2XYV8a91d9CL8UoDgLy8I0m1br-p6h4"
        def url = new URL("https://maps.googleapis.com/maps/api/geocode/json?address=${encoded}&key=${key}&callback=initMap")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozzilla/5.0")
        JsonSlurper json = new JsonSlurper()

        if (connection.getResponseCode() == 400) {
            println("Could not get Locations - BAD REQUEST - 400")
            return null
        } else {
            def location = json.parse(connection.getInputStream())
            return [latitude: location.results[0].geometry.location.lat, longitude: location.results[0].geometry.location.lng]
        }

    }
}
