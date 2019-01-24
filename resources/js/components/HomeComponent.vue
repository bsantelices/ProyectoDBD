<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 row justify-content-center">
                <div class="col-md-7">
                    <div class="card image-bg">
                        <div class="card-body">
                            <form action="" v-on:submit.prevent="FindFlight()">
                                <h2 class="card-title">Busca tu Vuelo !</h2>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                        </div>
                                        <select v-model="request.locationStart" required class="form-control" type="text">
                                            <option value="" selected disabled>Origen</option>
                                            <option v-for="( location, index) in locations" v-bind:value="location.id">{{ location.city }}, {{ location.country }}</option>
                                        </select>
                                        <select v-model="request.locationEnd" required class="form-control" type="text">
                                            <option value="" selected disabled>Destino</option>
                                            <option
                                                v-for="( location, index) in locations"
                                                v-if="location.id != request.locationStart"
                                                v-bind:value="location.id">
                                                    {{ location.city }}, {{ location.country }}
                                            </option>
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-calendar-check"></i></span>
                                        </div>
                                        <input v-model="request.dateStart" required id="datepicker" class="form-control" placeholder="Fecha Ida" type="text">
                                        <input v-model="request.dateEnd" required id="datepicker" class="form-control" placeholder="Fecha Vuelta" type="text">
                                    </div>

                                    <div class="form__options">
                                        <span class="form__answer"> 
                                            <input type="radio" name="match" id="match_1" value="guy" checked> 
                                            <label class="radio-label" for="match_1">
                                                Solo Ida
                                                <i class="fas fa-long-arrow-alt-right"></i>
                                            </label> 
                                        </span>
                                        
                                        <span class="form__answer"> 
                                            <input type="radio" name="match" id="match_2" value="girl"> 
                                            <label class="radio-label" for="match_2">
                                                Ida y Vuelta
                                                <i class="fas fa-exchange-alt"></i>
                                            </label> 
                                        </span>
                                        
                                        <span class="form__answer"> 
                                            <input type="radio" name="match" id="match_3" value="cat"> 
                                            <label class="radio-label" for="match_3">
                                                Con Escalas
                                                <i class="fas fa-shoe-prints"></i>
                                            </label> 
                                        </span>
                                    </div>

                                    <div class="flight-card-button">
                                        <button type="submit" class="btn btn-primary">
                                            Buscar Vuelo
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title">Ticket Reserva</h2>
                            <div v-if="request.locationStart && request.locationEnd" class="ticket-locations">
                                <div class="ticket-location">
                                    <span class="strong-text">{{ (FindLocation(request.locationStart)).locationInit }}</span>
                                    <span class="normal-text">{{ (FindLocation(request.locationStart)).locationName }}</span>
                                </div>
                                <i class="ticket-locations-icon fas fa-angle-right"></i>
                                <div class="ticket-location">
                                    <span class="strong-text">{{ (FindLocation(request.locationEnd)).locationInit }}</span>
                                    <span class="normal-text">{{ (FindLocation(request.locationEnd)).locationName }}</span>
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
            'locations'
        ],
        data() {
            return {
                request: {
                    locationStart: '',
                    locationEnd: '',
                    dateStart: '',
                    dateEnd: '',
                    type: 0
                },
            };
        },
        created() {
        },
        mounted() {
        },
        methods: {
            FindFlight() {
                console.log(this.request);
                // axios.post('/findFlight',this.request).then(
                //     (response) => {
                //         console.log(response.data)
                //     }
                // );
            },
            FindLocation(id) {
                let location = this.locations.find((location) => {
                    return location.id == id;
                });
                return {
                    locationName: location.city + ', ' + location.country,
                    locationInit: location.city[0] + location.country[0]
                };
            },
        }
    }
</script>

<style type="text/css">
.ticket-locations {
    border: 1px solid #dedede;
    border-radius: 0.25em;
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    padding: 1em;
    align-items: center;
}

.ticket-location {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
}

.ticket-locations-icon {
    font-size: 1.5em;
    margin-right: 15px;
    margin-left: 5px;
}
</style>