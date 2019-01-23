<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card step1">
                    <div class="card-header">
                        Featured
                    </div>
                    <div class="card-body row justify-content-center">
                        <div class="col-md-8">
                            <h2>Reserva desde...</h2>                  
                            <div class="input-group mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-map-pin"></i></span>
                                </div>
                                <input class="form-control" placeholder="Origen" type="text">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                </div>
                                <input class="form-control" placeholder="Destino" type="text">
                            </div>
                            <div class="vue-checkboxes">
                                <div class="radio">
                                    <input id="radio-1" name="radio" type="radio" checked>
                                    <label for="radio-1" class="radio-label">Ida</label>
                                </div>
                                <div class="radio">
                                    <input id="radio-2" name="radio" type="radio">
                                    <label  for="radio-2" class="radio-label">Ida y Vuelta</label>
                                </div>
                                <div class="radio">
                                    <input id="radio-3" name="radio" type="radio">
                                    <label for="radio-3" class="radio-label">Con Escalas</label>
                                </div>
                            </div> 
                            <div class="row justify-content-center">
                                <button type="button" class="btn btn-primary">Buscar Vuelo</button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="card step2">
                    <div class="card-body row justify-content-center">
                        <div class="col-md-8">
                            <h2>Quien Viaja</h2>
                            <div class="input-group mb-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-users"></i></span>
                                </div>
                                <input class="form-control" placeholder="Adultos" min="1" max="10" type="number">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-users"></i></span>
                                </div>
                                <input class="form-control" placeholder="Niños" min="1" max="10" type="number">
                            </div>
                            <div class="row justify-content-center">
                                <button type="button" class="btn btn-primary">Continuar</button>
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
            };
        },
        created() {
        },
        mounted() {
        },
        methods: {
        }
    }
</script>

<style type="text/css">
    .vue-checkboxes {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }
</style>