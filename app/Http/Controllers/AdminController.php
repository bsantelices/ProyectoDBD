<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Flight;
use App\Package;
use App\Vehicle;
use App\Role;
use App\Insurance;
use App\Plane;
use App\Discount;
use App\Location;
use Carbon\Carbon;
use App\Airport;

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $flights = Flight::all()->map(function ($flight) {
            $flight->created_at_format = (new Carbon($flight->created_at))->diffForHumans();
            $flight->locationStart = Location::find($flight->location_start);
            $flight->locationEnd = Location::find($flight->location_end);
            return $flight;
        });

        $planes = Plane::all()->map(function ($plane) {
            $plane->created_at_format = (new Carbon($plane->created_at))->diffForHumans();
            return $plane;
        });

        $locations = Location::all()->map(function ($location) {
            $location->created_at_format = (new Carbon($location->created_at))->diffForHumans();
            return $location;
        });

        $roles = Role::all()->map(function ($role) {
            $role->created_at_format = (new Carbon($role->created_at))->diffForHumans();
            return $role;
        });

        $insurances = Insurance::all()->map(function ($insurance) {
            $insurance->created_at_format = (new Carbon($insurance->created_at))->diffForHumans();
            return $insurance;
        });

        $discounts = Discount::all()->map(function ($discount) {
            $discount->created_at_format = (new Carbon($discount->created_at))->diffForHumans();
            return $discount;
        });

        $vehicles = Vehicle::all()->map(function ($vehicle) {
            $vehicle->created_at_format = (new Carbon($vehicle->created_at))->diffForHumans();
            return $vehicle;
        });

        $airports = Airport::all()->map(function ($airport) {
            $airport->created_at_format = (new Carbon($airport->created_at))->diffForHumans();
            return $airport;
        });

        $packages = Package::all()->map(function ($package) {
            $package->created_at_format = (new Carbon($package->created_at))->diffForHumans();
            return $package;
        });

        return view('admin.admin',[
            'admin' => Auth::user(),
            'flights' => $flights,
            'packages' => $packages,
            'vehicles'  => $vehicles,
            'roles' => $roles,
            'insurances' => $insurances,
            'discounts' => $discounts,
            'locations' => $locations,
            'planes' => $planes,
            'airports' => $airports
        ]);
    }
}
