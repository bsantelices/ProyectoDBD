<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 row justify-content-center">
                <div class="col-md-7">
                    <div class="card image-bg">
                        <div class="card-body">
                            <form v-if="!finding" action="" v-on:submit.prevent="FindFlight()">
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

                                    <div class="form__options">
                                        <span class="form__answer"> 
                                            <input v-model="request.type" type="radio" name="match" id="match_1" v-bind:value="1" checked> 
                                            <label class="radio-label" for="match_1">
                                                Solo Ida
                                                <i class="fas fa-long-arrow-alt-right"></i>
                                            </label> 
                                        </span>
                                        
                                        <span class="form__answer"> 
                                            <input v-model="request.type" type="radio" name="match" id="match_2" v-bind:value="2"> 
                                            <label class="radio-label" for="match_2">
                                                Ida y Vuelta
                                                <i class="fas fa-exchange-alt"></i>
                                            </label> 
                                        </span>
<!--                                         
                                        <span class="form__answer"> 
                                            <input v-model="request.type" type="radio" name="match" id="match_3" v-bind:value="3"> 
                                            <label class="radio-label" for="match_3">
                                                Con Escalas
                                                <i class="fas fa-shoe-prints"></i>
                                            </label> 
                                        </span> -->
                                    </div>

                                    <div class="flight-card-button">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Buscar Vuelo
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <form v-if="finding && finalCheck" action="" v-on:submit.prevent="ChooseFlight()">
                                <h2 class="card-title">Elije un Vuelo !</h2>
                                <div class="form-group">
                                    <div class="form__options">
                                        <span v-for="( posibleFlight, index) in posibleFlights" class="form__answer"> 
                                            <input v-model="requestPosible" type="radio" v-bind:name="posibleFlight.id" v-bind:id="posibleFlight.id" v-bind:value="posibleFlight"> 
                                            <label class="radio-label" v-bind:for="posibleFlight.id">
                                                <span><i class="fas fa-plane"></i> {{ posibleFlight.type }}</span>
                                                <hr>
                                                <span>Sale a la(s): 
                                                    {{ posibleFlight.go_at }}
                                                </span>
                                                <br>
                                                <span>Llega a la(s): 
                                                    {{ posibleFlight.return_at }}
                                                </span>
                                            </label> 
                                        </span>
                                    </div>

                                    <div class="flight-card-button">
                                        <button type="submit" class="btn btn-primary btn-block">
                                            Elejir Vuelo
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <form v-if="!finalCheck" action="" v-on:submit.prevent="FinalFlight()">
                                <h2 class="card-title">Todo listo !</h2>
                                <div class="flight-card-button">
                                    <button type="submit" class="btn btn-primary btn-block">
                                        Comprar Vuelo!
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title">Ticket Reserva</h2>
                            <div v-if="request.locationStart && request.locationEnd && request.locationStart != request.locationEnd" class="ticket-locations">
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
                            <div v-if="requestPosible" class="ticket-dates">
                                <div class="col-md-6 ticket-date ticket-date-left">
                                    <span class="normal-text">Sale a la(s):</span>
                                    <span class="strong-text-date">{{ requestPosible.go_at }}</span>
                                </div>
                                <div class="col-md-6 ticket-date">
                                    <span class="normal-text">Llega a la(s):</span>
                                    <span class="strong-text-date">{{ requestPosible.return_at }}</span>
                                </div>
                            </div>
                            <div v-if="requestPosible" class="ticket-dates">
                                <div class="col-md-12 ticket-date">
                                    <span class="normal-text">Tipo: {{ requestPosible.type }}</span>
                                    <span class="strong-text-date">Avión:</span>
                                    <span class="normal-text">{{ requestPosible.planeData.brand }}</span>
                                    <span class="strong-text-date">{{ auth.name }} {{ auth.lastname }}</span>
                                    <span class="strong-test-data">
                                        <span>Valor: </span>
                                        <span class="normal-text">{{ requestPosible.value }}</span>
                                    </span>
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
            'locations',
            'auth'
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
                finding: false,
                posibleFlights: {},
                requestPosible: '',
                finalCheck: true,
            };
        },
        created() {
        },
        mounted() {
        },
        methods: {
            FindFlight() {
                if (this.request.locationStart != this.request.locationEnd) {
                    axios.post('/findFlight',this.request).then(
                        (response) => {
                            this.posibleFlights = response.data;
                            this.finding = !this.finding;
                        }
                    );
                }
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
            ChooseFlight(){
                this.request.dateStart = this.requestPosible.go_at;
                this.request.dateEnd = this.requestPosible.return_at;
                this.finalCheck = !this.finalCheck;
            }
        }
    }
</script>

<style type="text/css">
.ticket-locations {
    border: 1px solid #dedede;
    border-top-right-radius: 9px;
    border-top-left-radius: 9px;
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

.ticket-dates {
    border-right: 1px solid #dedede;
    border-bottom: 1px solid #dedede;
    border-left: 1px solid #dedede;
    border-bottom-right-radius: 9px;
    border-bottom-left-radius: 9px;
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    padding: 1em;
    align-items: center;
}

.ticket-date-left {
    border-right: 1px solid #dedede;
}

.ticket-date {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
}
</style>