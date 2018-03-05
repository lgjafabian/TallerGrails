<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Agencies</title>
</head>
<body>

<div class="content scaffold-create" role="main">
    <h1>Agencies to Search</h1>
    <g:form method="GET" url="[controller:'Agencies', action:'show']">
        <fieldset class="form">
            <div class="fieldcontain required">
                <label for="paymentMethod">Payment Method: <span class="required-indicator">*</span></label>
                <select name="paymentMethod" id="paymentMethod">
                    <g:each in="${payment_methods}" var="p">
                        <g:if test="${p.payment_type_id == "ticket"}">
                            <option value="${p.id}">${p.name}</option>
                        </g:if>
                    </g:each>
                </select>
            </div>
            <br>
            <div class="fieldcontain required">
                <label for="address">Address: <span class="required-indicator">*</span></label>
                <input name="address" required id="address" value="Colon, 348, Cordoba" placeholder="Calle, Numero, Ciudad">
            </div>
            <br>

            <div class="fieldcontain required">
                <label for="radio">Radio: <span class="required-indicator">*</span></label>
                <input name="radio" required id="radio" value="300">
            </div>
            <br>


        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="search" value="Search"/>
        </fieldset>
    </g:form>
</div>

</body>
</html>
