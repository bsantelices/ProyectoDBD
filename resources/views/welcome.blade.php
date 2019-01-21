<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/welcome.js') }}" defer></script>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/welcome.css') }}" rel="stylesheet">
</head>
<body>
    <header class="header-global">
        <nav id="navbar-main" class="navbar navbar-main navbar-expand-lg navbar-transparent navbar-light headroom">
            <div class="container">
                <a class="navbar-brand mr-lg-5 nav-title" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse" id="navbar_global">
                    <div class="navbar-collapse-header">
                        <div class="row">
                            <div class="col-6 collapse-brand">
                                <a class="navbar-brand mr-lg-5 nav-title-mobile" href="{{ url('/') }}">
                                    {{ config('app.name', 'Laravel') }}
                                </a>
                            </div>
                            <div class="col-6 collapse-close">
                                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
                                  <span></span>
                                  <span></span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <ul class="navbar-nav navbar-nav-hover align-items-lg-center">
                        <!-- left navbar side -->
                    </ul>
                    <ul class="navbar-nav align-items-lg-center ml-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link nav-link-icon" href="#" target="_blank" data-toggle="tooltip" title="Like us on Facebook">
                                <i class="fab fa-facebook-square"></i>
                                <span class="nav-link-inner--text d-lg-none">Facebook</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-icon" href="#" target="_blank" data-toggle="tooltip" title="Follow us on Instagram">
                                <i class="fab fa-instagram"></i>
                                <span class="nav-link-inner--text d-lg-none">Instagram</span>
                            </a>
                        </li>
                        @auth
                            <li class="nav-item d-none d-lg-block ml-lg-4">
                                <a href="{{ url('/home') }}" class="btn btn-neutral btn-icon">
                                    <span class="nav-link-inner--text">Inicio</span>
                                </a>
                            </li>
                        @else
                            <li class="nav-item d-none d-lg-block ml-lg-4">
                                <a href="{{ route('login') }}" class="btn btn-neutral btn-icon">
                                    <span class="nav-link-inner--text">Entrar</span>
                                </a>
                            </li>
                        @endauth
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <main>
        <div class="position-relative main">
            <section class="section section-lg section-shaped pb-250">
                <div class="shape shape-style-1 shape-default">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="container py-lg-md d-flex">
                    <div class="col px-0">
                        <div class="row">
                            <div class="col-lg-5 landing-image">
                                <img src="/img/welcome/travel.png" width="300">
                            </div>
                            <div class="col-lg-7">
                                <h1 class="display-3  text-white">¡Escápate en Marzo!
                                    <span>desde US$859/$597.864</span>
                                </h1>
                                <p class="lead  text-white">Viaja más cómodo comprando tu asiento en LarAvion. <br>¡No te quedes abajo!</p>
                                <div class="btn-wrapper">
                                    <a id="buyTicket" href="#buy" class="btn btn-default btn-icon mb-3 mb-sm-0">
                                        <span class="btn-inner--icon"><i class="fas fa-plane"></i></span>
                                        <span class="btn-inner--text">Comprar</span>
                                    </a>
                                    @auth
                                        <a href="#" class="btn btn-white btn-icon mb-3 mb-sm-0">
                                            <span class="btn-inner--text">Mis vuelos</span>
                                        </a>
                                    @else
                                        <a href="{{ url('/register') }}" class="btn btn-white btn-icon mb-3 mb-sm-0">
                                            <span class="btn-inner--text">Registrarse</span>
                                        </a>
                                    @endauth
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- curve line -->
                <div class="separator separator-bottom separator-skew">
                    <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
                        <polygon class="fill-white" points="2560 0 2560 100 0 100"></polygon>
                    </svg>
                </div>
            </section>
        </div>
        <section id="buy" class="section section-lg pt-lg-0 mt--200">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="row row-grid">
                            <div class="col-lg-12">
                                <div class="main-form card shadow border-0">
                                    <h1 class="display-3 ">Busca tu Vuelo <i class="fas fa-plane-departure"></i></h1>
                                    <div class="main-form card-body py-5">
                                        <form>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="input-group mb-4">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-exchange-alt"></i></span>
                                                        </div>
                                                        <select class="custom-select" id="inputGroupSelect01">
                                                            <option value="1" selected="">Ida y Vuelta</option>
                                                            <option value="0">Ida</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="input-group mb-4">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fas fa-users"></i></span>
                                                        </div>
                                                        <input class="form-control" placeholder="Cantidad" min="1" max="10" type="number">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="input-group mb-4">
                                                        <div class="input-group-prepend">
                                                            <label class="input-group-text" for="inputGroupSelect01">Tipo</label>
                                                        </div>
                                                        <select class="custom-select" id="inputGroupSelect01">
                                                            <option value="economy" selected>Economico</option>
                                                            <option value="business">negocio</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
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
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <div class="input-group mb-4">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><i class="fas fa-calendar-check"></i>
                                                            </div>
                                                            <input class="form-control datepicker" placeholder="Fecha Ida" value="{{ Carbon\Carbon::now()->format('d/m/Y') }}" type="text">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text"><i class="fas fa-calendar-week"></i>
                                                            </div>
                                                            <input class="form-control datepicker" placeholder="Fecha Vuelta" type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <a href="#" class="btn btn-primary mt-4"><i class="fas fa-search"></i> Buscar Vuelo</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section">
            <div class="container">
                <div class="row row-grid align-items-center">
                    <div class="col-md-6">
                        <div class="card bg-default shadow border-0">
                            <img src="img/welcome/img-1-1200x1000.jpg" class="card-img-top">
                            <blockquote class="card-blockquote">
                                <svg preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 583 95" class="svg-bg">
                                    <polygon points="0,52 583,95 0,95" class="fill-default" />
                                    <polygon points="0,42 583,95 683,0 0,95" opacity=".2" class="fill-default" />
                                </svg>
                                <h4 class="display-3 font-weight-bold text-white">¡Tomate un Descanso!</h4>
                                <p class="lead text-italic text-white">Aqui explico algo de algun paquete para darle color.</p>
                            </blockquote>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="pl-md-5">
                            <div>
                                <div class="icon icon-lg icon-shape icon-shape-info shadow rounded-circle mb-5">
                                    <i class="fas fa-globe-americas"></i>
                                </div>
                                <div class="icon icon-lg icon-shape icon-shape-success shadow rounded-circle mb-5">
                                    <i class="fas fa-check"></i>
                                </div>
                                <div class="icon icon-lg icon-shape icon-shape-danger shadow rounded-circle mb-5">
                                    <i class="fas fa-plane"></i>
                                </div>
                            </div>
                            <h3>Pasajes desde $10.000</h3>
                            <p class="lead">Chamullo algo de que existen pasajes bla bla bla, sera realmente necesaria esta seccion ? la hice solo por que no me gusta que termine el cuadro anterior en seco.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris.</p>
                            <a href="#" class="font-weight-bold text-warning mt-5">A beautiful UI Kit for impactful websites</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>