<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 row justify-content-center">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="admin-profile-info">
                                <img src="/img/avatar.png" class="admin-userimage">
                                <span class="admin-name strong-text">{{ admin.name }}, {{ admin.lastname }}</span>
                                <span class="admin-username normal-text">{{ admin.username }}</span>
                            </div>
                            <hr>
                            <button @click.prevent="state = 'flight'" v-bind:class="[activeClass('flight')]">Vuelos</button>
                            <button @click.prevent="state = 'plane'" v-bind:class="[activeClass('plane')]">Aviónes</button>
                            <button @click.prevent="state = 'airport'" v-bind:class="[activeClass('airport')]">Aereopuertos</button>
                            <button @click.prevent="state = 'location'" v-bind:class="[activeClass('location')]">Ubicaciones</button>
                            <button @click.prevent="state = 'package'" v-bind:class="[activeClass('package')]">Paquetes</button>
                            <button @click.prevent="state = 'vehicle'" v-bind:class="[activeClass('vehicle')]">Vehiculos</button>
                            <button @click.prevent="state = 'role'" v-bind:class="[activeClass('role')]">Roles</button>
                            <button @click.prevent="state = 'insurance'" v-bind:class="[activeClass('insurance')]">Seguros</button>
                            <button @click.prevent="state = 'discount'" v-bind:class="[activeClass('discount')]">Descuentos</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div v-if="state=='flight'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Vuelos
                                <button @click.prevent="flightForm = !flightForm" class="btn btn-primary">
                                    <span v-if="!flightForm"><i class="fas fa-plus"></i> Crear Vuelo</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="flightForm" action="" v-on:submit.prevent="createFlight()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <select v-model="requestFlight.locationStart" required class="form-control" type="text">
                                                <option value="" selected disabled>Origen</option>
                                                <option v-for="( location, index) in locations" v-bind:value="location.id">{{ location.city }}, {{ location.country }}</option>
                                            </select>
                                            <select v-model="requestFlight.locationEnd" required class="form-control" type="text">
                                                <option value="" selected disabled>Destino</option>
                                                <option
                                                    v-for="( location, index) in locations"
                                                    v-if="location.id != requestFlight.locationStart"
                                                    v-bind:value="location.id">
                                                        {{ location.city }}, {{ location.country }}
                                                </option>
                                            </select>
                                            <input v-model="requestFlight.dateStart" required id="datepicker" class="form-control" placeholder="Fecha Ida" type="text">
                                            <input v-model="requestFlight.dateEnd" required id="datepicker" class="form-control" placeholder="Fecha Vuelta" type="text">
                                            <input v-model="requestFlight.value" class="form-control" placeholder="Valor" min="1" max="500000" type="number">
                                            <div class="input-group">
                                                <select v-model="requestFlight.plane" required class="form-control" type="text">
                                                    <option value="" selected disabled>Avión</option>
                                                    <option
                                                        v-for="( plane, index) in planesVue"
                                                        v-bind:value="plane.id">
                                                            {{ plane.brand }}, {{plane.capacity}}
                                                    </option>
                                                </select>
                                                <select v-model="requestFlight.airport" required class="form-control" type="text">
                                                    <option value="" selected disabled>Aereopuerto</option>
                                                    <option
                                                        v-for="( airport, index) in airportsVue"
                                                        v-bind:value="airport.id">
                                                            {{ airport.name }}
                                                    </option>
                                                </select>
                                                <input v-model="requestFlight.Type" required class="form-control" placeholder="Tipo" type="text">
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Crear Vuelo
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( flight, index) in flightsVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deleteFlight(flight.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ flight.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Lugar de partida</span>
                                        <span class="normal-text-admin">{{ flight.locationStart.city }}, {{ flight.locationStart.country }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Lugar de llegada</span>
                                        <span class="normal-text-admin">{{ flight.locationEnd.city }}, {{ flight.locationEnd.country }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Tipo</span>
                                        <span class="normal-text-admin">{{ flight.type }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ flight.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="state=='plane'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Aviónes
                                <button @click.prevent="planeForm = !planeForm" class="btn btn-primary">
                                    <span v-if="!planeForm"><i class="fas fa-plus"></i> Registrar Un Nuevo Avión</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="planeForm" action="" v-on:submit.prevent="createPlane()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <input v-model="requestPlane.brand" required class="form-control" placeholder="Marca" type="text">
                                            <input v-model="requestPlane.capacity" class="form-control" placeholder="Capacidad" min="1" max="500" type="number">
                                            <select v-model="requestPlane.airport" required class="form-control" type="text">
                                                <option value="" selected disabled>Aereopuerto</option>
                                                <option
                                                    v-for="( airport, index) in airportsVue"
                                                    v-bind:value="airport.id">
                                                        {{ airport.name }}
                                                </option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Registrar Avión
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( plane, index) in planesVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deletePlane(plane.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ plane.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Marca</span>
                                        <span class="normal-text-admin">{{ plane.brand }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Capacidad</span>
                                        <span class="normal-text-admin">{{ plane.capacity }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Aereopuerto</span>
                                        <span class="normal-text-admin">{{ plane.airport_id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ plane.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="state=='airport'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Aereopuertos
                                <button @click.prevent="airportForm = !airportForm" class="btn btn-primary">
                                    <span v-if="!airportForm"><i class="fas fa-plus"></i> Registrar un Nuevo Aereopuerto</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="airportForm" action="" v-on:submit.prevent="createAirport()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <select v-model="requestAirport.location" required class="form-control" type="text">
                                                <option value="" selected disabled>Ubicación</option>
                                                <option v-for="( location, index) in locations" v-bind:value="location.id">{{ location.city }}, {{ location.country }}</option>
                                            </select>
                                            <input v-model="requestAirport.name" required class="form-control" placeholder="Nombre" type="text">
                                            <input v-model="requestAirport.Type" required class="form-control" placeholder="Tipo" type="text">
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Registrar Aereopuerto
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( airport, index) in airportsVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deleteAirport(airport.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ airport.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Nombre</span>
                                        <span class="normal-text-admin">{{ airport.name }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Tipo</span>
                                        <span class="normal-text-admin">{{ airport.type }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Ubicación</span>
                                        <span class="normal-text-admin">{{ airport.location_id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ airport.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="state=='location'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Ubicaciones
                                <button @click.prevent="locationForm = !locationForm" class="btn btn-primary">
                                    <span v-if="!locationForm"><i class="fas fa-plus"></i> Registrar Una Nueva Ubicacíon</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="locationForm" action="" v-on:submit.prevent="createLocation()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <input v-model="requestLocation.coordinates" required class="form-control" placeholder="Coordenadas" type="text">
                                            <input v-model="requestLocation.city" required class="form-control" placeholder="Ciudad" type="text">
                                            <input v-model="requestLocation.country" required class="form-control" placeholder="Pais" type="text">
                                            <input v-model="requestLocation.postalCode" required class="form-control" placeholder="Codigo Postal" type="text">
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Registrar Avión
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( location, index) in locationsVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deleteLocation(location.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ location.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Coordenadas</span>
                                        <span class="normal-text-admin">{{ location.coordinates }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Ciudad</span>
                                        <span class="normal-text-admin">{{ location.city }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Pais</span>
                                        <span class="normal-text-admin">{{ location.country }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Codigo postal</span>
                                        <span class="normal-text-admin">{{ location.postalCode }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ location.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="state=='package'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Paquetes
                                <button @click.prevent="packageForm = !packageForm" class="btn btn-primary">
                                    <span v-if="!packageForm"><i class="fas fa-plus"></i> Crear un Paquete</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="packageForm" action="" v-on:submit.prevent="createPackage()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <input v-model="requestPackage.value" class="form-control" placeholder="Valor" min="1" max="1000000" type="number">
                                            <input v-model="requestPackage.type" required class="form-control" placeholder="Tipo" type="text">
                                        </div>
                                        <div class="input-group">
                                            <textarea style="resize: none;" v-model="requestPackage.description" required class="form-control" placeholder="descripción" type="text" />
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Crear Paquete
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( package, index) in packagesVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deletePackage(package.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                        <button @click.prevent="editPackage(package.id)" class="btn btn-light"><i class="fas fa-edit"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ package.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Valor</span>
                                        <span class="normal-text-admin">${{ package.value }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Tipo</span>
                                        <span class="normal-text-admin">{{ package.type }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Descripción</span>
                                        <span class="normal-text-admin">{{ package.description }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ package.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="state=='vehicle'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Vehiculos
                                <button @click.prevent="vehicleForm = !vehicleForm" class="btn btn-primary">
                                    <span v-if="!vehicleForm"><i class="fas fa-plus"></i> Registrar un Vehiculo</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="vehicleForm" action="" v-on:submit.prevent="createVehicle()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <input v-model="requestVehicle.capacity" class="form-control" placeholder="Capacidad" min="1" max="20" type="number">
                                            <input v-model="requestVehicle.model" required class="form-control" placeholder="Modelo" type="text">
                                            <input v-model="requestVehicle.brand" required class="form-control" placeholder="Marca" type="text">
                                            <input v-model="requestVehicle.patent" required class="form-control" placeholder="Patente" type="text">
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Registrar Vehiculo
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( vehicle, index) in vehiclesVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deleteVehicle(vehicle.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ vehicle.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Capacidad</span>
                                        <span class="normal-text-admin">{{ vehicle.capacity }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Modelo</span>
                                        <span class="normal-text-admin">{{ vehicle.model }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Marca</span>
                                        <span class="normal-text-admin">{{ vehicle.brand }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Patente</span>
                                        <span class="normal-text-admin">{{ vehicle.patent }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ vehicle.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="state=='role'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Roles
                                <button @click.prevent="roleForm = !roleForm" class="btn btn-primary">
                                    <span v-if="!roleForm"><i class="fas fa-plus"></i> Crear un Rol</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="roleForm" action="" v-on:submit.prevent="createRole()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <input v-model="requestRole.name" required class="form-control" placeholder="Nombre" type="text">
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Crear Role
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( role, index) in rolesVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deleteRole(role.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ role.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Nombre</span>
                                        <span class="normal-text-admin">{{ role.name }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ role.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="state=='insurance'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Seguros
                                <button @click.prevent="insuranceForm = !insuranceForm" class="btn btn-primary">
                                    <span v-if="!insuranceForm"><i class="fas fa-plus"></i> Crear un Seguro</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="insuranceForm" action="" v-on:submit.prevent="createInsurance()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <input v-model="requestInsurance.value" class="form-control" placeholder="Valor" min="1" max="100000" type="number">
                                            <input v-model="requestInsurance.Type" required class="form-control" placeholder="Tipo" type="text">
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Crear Seguro
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( insurance, index) in insurancesVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deleteInsurance(insurance.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ insurance.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Valor</span>
                                        <span class="normal-text-admin">${{ insurance.value }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Tipo</span>
                                        <span class="normal-text-admin">{{ insurance.type }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ insurance.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div v-if="state=='discount'" class="card image-bg">
                        <div class="admin-card card-body">
                            <h2 class="admin-title card-title">
                                Descuentos
                                <button @click.prevent="discountForm = !discountForm" class="btn btn-primary">
                                    <span v-if="!discountForm"><i class="fas fa-plus"></i> Crear un Descuento</span>
                                    <span v-else><i class="fas fa-minus"></i> Esconder Formulario</span>
                                </button>
                            </h2>
                            <div>
                                <form class="row justify-content-center" v-if="discountForm" action="" v-on:submit.prevent="createDiscount()">
                                    <div class="col-md-10 admin-form-div">
                                        <div class="input-group">
                                            <input v-model="requestDiscount.amount" class="form-control" placeholder="Valor" min="1" max="100000" type="number">
                                            <input v-model="requestDiscount.Type" required class="form-control" placeholder="Tipo" type="text">
                                            <input v-model="requestDiscount.title" required class="form-control" placeholder="Titulo" type="text">
                                        </div>
                                        <div class="input-group">
                                            <textarea style="resize: none;" v-model="requestDiscount.description" required class="form-control" placeholder="descripción" type="text" />
                                        </div>
                                        <button type="submit" class="btn btn-success">
                                            Crear Descuento
                                        </button>
                                        <br>
                                    </div>
                                </form>
                            </div>
                            <div class="admin-list-container">
                                <div v-for="( discount, index) in discountsVue" class="admin-list">
                                    <div class="admin-list-icon">
                                        <button @click.prevent="deleteDiscount(discount.id)" class="btn btn-primary"><i class="fas fa-times"></i></button>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">codigo</span>
                                        <span class="normal-text-admin">{{ discount.id }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Valor</span>
                                        <span class="normal-text-admin">${{ discount.amount }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Tipo</span>
                                        <span class="normal-text-admin">{{ discount.type }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Titulo</span>
                                        <span class="normal-text-admin">{{ discount.title }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">Descripción</span>
                                        <span class="normal-text-admin">{{ discount.description }}</span>
                                    </div>
                                    <div class="admin-list-div">
                                        <span class="strong-text-admin">creación</span>
                                        <span class="normal-text-admin">{{ discount.created_at_format }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: [
            'admin',
            'flights',
            'packages',
            'vehicles',
            'roles',
            'insurances',
            'discounts',
            'locations',
            'planes',
            'airports'
        ],
        data() {
            return {
                state: 'flight',
                flightsVue: this.flights.reverse(),
                flightForm: false,
                requestFlight: {
                    locationStart: '',
                    locationEnd: '',
                    dateStart: '',
                    dateEnd: '',
                    Type: '',
                    plane: '',
                    airport: '',
                },
                planesVue: this.planes.reverse(),
                planeForm: false,
                requestPlane: {
                    brand: '',
                    capacity: '',
                    airport: '',
                },
                airportsVue: this.airports.reverse(),
                airportForm: false,
                requestAirport: {
                    name: '',
                    Type: '',
                    location: '',
                },
                locationsVue: this.locations.reverse(),
                locationForm: false,
                requestLocation: {
                    coordinates: '',
                    city: '',
                    country: '',
                    postalCode: '',
                },
                rolesVue: this.roles.reverse(),
                roleForm: false,
                requestRole: {
                    name: '',
                },
                insurancesVue: this.insurances.reverse(),
                insuranceForm: false,
                requestInsurance: {
                    value: '',
                    Type: '',
                },
                discountsVue: this.discounts.reverse(),
                discountForm: false,
                requestDiscount: {
                    amount: '',
                    Type: '',
                    title: '',
                    description: '',
                },
                vehiclesVue: this.vehicles.reverse(),
                vehicleForm: false,
                requestVehicle: {
                    capacity: '',
                    model: '',
                    brand: '',
                    patent: '',
                },
                packagesVue: this.packages.reverse(),
                packageForm: false,
                requestPackage: {
                    value: '',
                    description: '',
                    type: '',
                },
            };
        },
        created() {
        },
        mounted() {
        },
        methods: {
            activeClass(state){
                if (this.state == state) {
                    return 'btn btn-primary btn-block';
                } else {
                    return 'btn btn-light btn-block';
                }
            },
            createFlight(){
                let request = {
                    type: this.requestFlight.Type,
                    luggageCapacity: 100,
                    plane_id: this.requestFlight.plane,
                    airport_id: this.requestFlight.airport,
                    location_start: this.requestFlight.locationStart,
                    location_end: this.requestFlight.locationEnd,
                    go_at: this.requestFlight.dateStart,
                    return_at: this.requestFlight.dateEnd,
                    value: this.requestFlight.value,
                };
                this.requestFlight = {
                    locationStart: '',
                    locationEnd: '',
                    dateStart: '',
                    dateEnd: '',
                    Type: '',
                    plane: '',
                    value: '',
                    airport: '',
                };
                axios.post('/flights',request).then(
                    (response) => {
                        this.flightsVue.unshift(response.data);
                    }
                );
            },
            deleteFlight(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/flights/'+id).then(
                        (response) => {
                            this.flightsVue = this.flightsVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
            createPlane(){
                let request = {
                    brand: this.requestPlane.brand,
                    capacity: this.requestPlane.capacity,
                    airport_id: this.requestPlane.airport
                };
                this.requestPlane = {
                    brand: '',
                    capacity: '',
                    airport: '',
                };
                axios.post('/planes',request).then(
                    (response) => {
                        this.planesVue.unshift(response.data);
                    }
                );
            },
            deletePlane(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/planes/'+id).then(
                        (response) => {
                            this.planesVue = this.planesVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
            createAirport(){
                let request = {
                    name: this.requestAirport.name,
                    type: this.requestAirport.Type,
                    location_id: this.requestAirport.location
                }
                this.requestAirport = {
                    name: '',
                    Type: '',
                    location: '',
                };
                axios.post('/airports',request).then(
                    (response) => {
                        this.airportsVue.unshift(response.data);
                    }
                );
            },
            deleteAirport(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/airports/'+id).then(
                        (response) => {
                            this.airportsVue = this.airportsVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
            createLocation(){
                let request = {
                    coordinates: this.requestLocation.coordinates,
                    city: this.requestLocation.city,
                    country: this.requestLocation.country,
                    postalCode: this.requestLocation.postalCode,
                };
                this.requestLocation = {
                    coordinates: '',
                    city: '',
                    country: '',
                    postalCode: '',
                };
                axios.post('/locations',request).then(
                    (response) => {
                        this.locationsVue.unshift(response.data);
                    }
                );
            },
            deleteLocation(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/locations/'+id).then(
                        (response) => {
                            this.locationsVue = this.locationsVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
            createRole(){
                let request = {
                    name: this.requestRole.name,
                };
                this.requestRole = {
                    name: '',
                };
                axios.post('/roles',request).then(
                    (response) => {
                        this.rolesVue.unshift(response.data);
                    }
                );
            },
            deleteRole(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/roles/'+id).then(
                        (response) => {
                            this.rolesVue = this.rolesVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
            createInsurance(){
                let request = {
                    value: this.requestInsurance.value,
                    type: this.requestInsurance.Type,
                };
                this.requestInsurance = {
                    value: '',
                    Type: '',
                };
                axios.post('/insurances',request).then(
                    (response) => {
                        this.insurancesVue.unshift(response.data);
                    }
                );
            },
            deleteInsurance(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/insurances/'+id).then(
                        (response) => {
                            this.insurancesVue = this.insurancesVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
            createDiscount(){
                let request = {
                    amount: this.requestDiscount.amount,
                    Type: this.requestDiscount.Type,
                    title: this.requestDiscount.title,
                    description: this.requestDiscount.description,
                };
                this.requestInsurance = {
                    amount: '',
                    Type: '',
                    title: '',
                    description: '',
                };
                axios.post('/discounts',request).then(
                    (response) => {
                        this.discountsVue.unshift(response.data);
                    }
                );
            },
            deleteDiscount(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/discounts/'+id).then(
                        (response) => {
                            this.discountsVue = this.discountsVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
            createVehicle(){
                let request = {
                    capacity: this.requestVehicle.capacity,
                    model: this.requestVehicle.model,
                    brand: this.requestVehicle.brand,
                    patent: this.requestVehicle.patent,
                };
                this.requestVehicle = {
                    capacity: '',
                    model: '',
                    brand: '',
                    patent: '',
                };
                axios.post('/vehicles',request).then(
                    (response) => {
                        this.vehiclesVue.unshift(response.data);
                    }
                );
            },
            deleteVehicle(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/vehicles/'+id).then(
                        (response) => {
                            this.vehiclesVue = this.vehiclesVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
            createPackage(){
                let request = {
                    value: this.requestPackage.value,
                    description: this.requestPackage.description,
                    type: this.requestPackage.type,
                };
                this.requestPackage = {
                    value: '',
                    description: '',
                    type: '',
                };
                axios.post('/packages',request).then(
                    (response) => {
                        this.packagesVue.unshift(response.data);
                    }
                );
            },
            deletePackage(id){
                swal({
                  title: "Estás Seguro?",
                  text: "Una vez borrado, no podrás recuperar la información!",
                  icon: "warning",
                  buttons: true,
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    axios.delete('/packages/'+id).then(
                        (response) => {
                            this.packagesVue = this.packagesVue.filter(elem => elem.id != id);
                            swal("Listo!", "Se ha eliminado correctamente!", "success");
                        }
                    );
                  } else {
                    swal({
                        title: "No se ha borrado el archivo!",
                    });
                  }
                });
            },
        }
    }
</script>

<style type="text/css">
.admin-profile-info {
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
    width: 100%;
}

.admin-username {
    width: 80%;
    height: 1.3em;
    overflow: hidden;
}

.admin-form-div {
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
}

.admin-title {
    padding-left: 1em;
}

.admin-title button {
    margin-left: 1em;
}

.admin-userimage {
    height: 50px;
    width: 50px;
    border-radius: 50%;
}

.admin-name {
    font-size: 1.1em !important;
}

.btn-light {
    background-color: #dedede !important;
}

.admin-list-container {
    max-height: 60vh;
    width: 100%;
    overflow-y: scroll;
    overflow-x: hidden;
}

.admin-list {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    background-color: #282828;
    color: #fff;
    border-bottom: solid 1px rgba(255, 255, 255, 0.05);
    padding: 1em;
}

.admin-list-div {
    display: flex;
    justify-content: space-around;
    align-items: center;
    flex-direction: column;
    border-right: solid 1px rgba(255, 255, 255, 0.05);
    height: 100%;
    padding-right: 5px;
    padding-left: 5px;
    min-width: 16%;
}

.admin-card {
    padding-right: 0px !important;
    padding-bottom: 0px !important;
    padding-left: 0px !important;
}

.admin-list-icon {
    height: 100%;
    width: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-direction: column;
    border-right: solid 1px rgba(255, 255, 255, 0.05);
    margin-right: 10px;
}

.admin-list-icon button {
    margin-top: 10px;
}
</style>