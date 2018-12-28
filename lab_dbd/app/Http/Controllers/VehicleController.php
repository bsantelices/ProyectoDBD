<?php

namespace App\Http\Controllers;

use App\Vehicle;
use Illuminate\Http\Request;

class VehicleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $vehicle = Vehicle::all();
        return $vehicle;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $vehicle = new Vehicle();
        $vehicle->capacity = $request->capacity;
        $vehicle->model = $request->model;
        $vehicle->brand = $request->brand;
        $vehicle->patent = $request->patent;
        $vehicle->save();
        $vehicle = Vehicle::all();
        return $vehicle;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Vehicle  $vehicle
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $vehicle = Vehicle::find($id);
        return $vehicle;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Vehicle  $vehicle
     * @return \Illuminate\Http\Response
     */
    public function edit(Vehicle $vehicle)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Vehicle  $vehicle
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $vehicle = Vehicle::find($id);
        $vehicle->capacity = $request->capacity;
        $vehicle->model = $request->model;
        $vehicle->brand = $request->brand;
        $vehicle->patent = $request->patent;
        $vehicle->save();
        return $vehicle;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Vehicle  $vehicle
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $vehicle = Vehicle::find($id);
        $vehicle->save();
        return Vehicle::all();
    }
}
