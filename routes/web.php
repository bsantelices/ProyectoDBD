<?php

// first view
Route::get('/', function () {
    return view('welcome');
});

// user can register and login
Auth::routes();

// home site
Route::get('/home', 'HomeController@index')->name('home');

// Users
Route::resource('users','UserController');

// user can see his log of things
Route::resource('logs','LogController');

// add payment method
Route::resource('paymentMethods','PaymentMethodController');

// make reservation
/*
 * with different payment methods
 * Create a reservation ONLY to go
 * with an insurance
 * Create a reservation to go and return
 * See my Reservations
 * with packages
 */
Route::resource('reservations','ReservationController');

// create airports
Route::resource('airports','AirportController');

// create discounts
Route::resource('discounts','DiscountController');

// create hotels
Route::resource('hotels','HotelController');

// create insurances
Route::resource('insurances','InsuranceController');

// create locations
Route::resource('locations','LocationController');

// create packages
Route::resource('packages','PackageController');

// create planes
Route::resource('planes','PlaneController');

// create a flight
Route::resource('flights','FlightController');

// create roles
Route::resource('roles','RoleController');

// create rooms
Route::resource('rooms','RoomController');

// create seats
Route::resource('seats','SeatController');

// create vehicles
Route::resource('vehicles','VehicleController');

// see transactions by user
Route::resource('users.reservations','User\ReservationController');


// USER
Route::post('/findFlight','FlightController@find');

// ADMIN
Route::group(['middleware' => 'admin'], function () {
    Route::get('/admin', 'AdminController@index')->name('admin');
});