<?php

namespace App\Http\Controllers;

use App\Flight;
use Illuminate\Http\Request;

class FlightController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $flight = Flight::all();
        return $flight;
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
        $flight = new Flight();
        $flight->coordinatesStart = $request->coordinatesStart;
        $flight->coordinatesEnd = $request->coordinatesEnd;
        $flight->type = $request->type;
        $flight->luggageCapacity = $request->luggageCapacity;
        $flight->airport_id = $request->airport_id;
        $flight->save();
        $flight = Flight::all();
        return $flight;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $flight = Flight::find($id);
        return $flight;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function edit(Flight $flight)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $flight = Flight::find($id);
        $flight->coordinatesStart = $request->coordinatesStart;
        $flight->coordinatesEnd = $request->coordinatesEnd;
        $flight->type = $request->type;
        $flight->luggageCapacity = $request->luggageCapacity;
        $flight->airport_id = $request->airport_id;
        $flight->save();
        return $flight;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $flight = Flight::find($id);
        $flight->delete();
        return Flight::all();
    }
}
