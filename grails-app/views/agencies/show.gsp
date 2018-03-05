<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Agencies</title>
</head>

<body>

<div style="overflow-y: scroll; height:250px;">
    <table>
        <thead>
        <td><strong>Description</strong></td>
        <td><strong>Distance</strong></td>
        <td><strong>Details</strong></td>
        </thead>
        <tbody>
        <g:each in="${agencies}" var="p">
            <tr>
                <td>${p.description}</td>
                <td>${p.distance.toFloat().toInteger()}</td>
                <td><button id="${"info" + p.agency_code}" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="${"#modal" + p.agency_code}">?</button></td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>

<div id="map" style="height: 400px; width: 100%;"></div>

<g:each in="${agencies}" var="p">
    <div id="${"modal" + p.agency_code}" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>

                <div class="modal-body">
                    <strong>Direccion:</strong> ${p.address.address_line} <br>
                    <strong>Ciudad:</strong> ${p.address.city} <br>
                    <strong>Pais:</strong> ${p.address.country} <br>
                    <strong>Localicacion:</strong> <p∫ class="locations">${p.address.location}</p∫> <br>
                    <strong>Estado:</strong> ${p.address.state} <br>
                    <strong>Codigo postal:</strong> ${p.address.zip_code} <br>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</g:each>


<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe2XYV8a91d9CL8UoDgLy8I0m1br-p6h4&callback=initMap"></script>
<script>
    function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 17,
            center: {lat: ${centerLat}, lng: ${centerLong}}
        });
        var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        var markers = locations.map(function (location, i) {
            return new google.maps.Marker({position: location, label: labels[i % labels.length]});
        });
        var markerCluster = new MarkerClusterer(map, markers, {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
    }

    var locationsAux = document.getElementsByClassName("locations")
    var locations = []
    for (i = 0; i < locationsAux.length; i++) {
        var locAux = locationsAux[i].textContent.split(',')
        locations.push({lat: parseFloat(locAux[0]), lng: parseFloat(locAux[1])})
    }
</script>
</body>
</html>

