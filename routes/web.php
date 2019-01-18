<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resource('airports','AirportController');
Route::resource('discounts','DiscountController');
Route::resource('flights','FlightController');
Route::resource('hotels','HotelController');
Route::resource('insurances','InsuranceController');
Route::resource('locations','LocationController');
Route::resource('logs','LogController');
Route::resource('packages','PackageController');
Route::resource('paymentMethods','PaymentMethodController');
Route::resource('planes','PlaneController');
Route::resource('reservations','ReservationController');
Route::resource('roles','RoleController');
Route::resource('rooms','RoomController');
Route::resource('seats','SeatController');
Route::resource('users','UserController');
Route::resource('vehicles','VehicleController');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
