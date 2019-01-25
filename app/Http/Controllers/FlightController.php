<?php

namespace App\Http\Controllers;

use App\Flight;
use Illuminate\Http\Request;
use App\Location;
use App\Plane;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class FlightController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Flight::all();
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
        $validator = Validator::make($request->all(), [
            'type'             => 'required|string|max:255',
            'location_start' => 'required|integer',
            'location_end'   => 'required|integer',
            'luggageCapacity'  => 'required|integer',
            'airport_id'       => 'required|integer',
            'plane_id'      => 'required|integer',
            'go_at'       => 'required|string',
            'return_at'       => 'required|string',
            'value'            => 'required|integer'
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $flight = Flight::create([
            'type'             => $request->type,
            'location_start' => $request->location_start,
            'location_end'   => $request->location_end,
            'luggageCapacity'  => $request->luggageCapacity,
            'airport_id'       => $request->airport_id,
            'plane_id'       => $request->plane_id,
            'go_at'             => Carbon::createFromFormat('d/m/Y', $request->go_at),
            'return_at'         => Carbon::createFromFormat('d/m/Y', $request->return_at),
            'value'             => $request->value,
        ]);
        $flight->created_at_format = (new Carbon($flight->created_at))->diffForHumans();
        $flight->locationStart = Location::find($flight->location_start);
        $flight->locationEnd = Location::find($flight->location_end);
        return $flight;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function show(Flight $flight)
    {
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
    public function update(Request $request, Flight $flight)
    {
        $validator = Validator::make($request->all(), [
            'type'             => 'required|string|max:255',
            'coordinatesStart' => 'required|string|max:255',
            'coordinatesEnd'   => 'required|string|max:255',
            'luggageCapacity'  => 'required|integer',
            'airport_id'       => 'required|integer',
            'value'            => 'required|integer'
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $flight->update($request->all());
        $flight->save();
        return $flight;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function destroy(Flight $flight)
    {
        $flight->delete();
        return response('Ok', 200)
            ->header('Content-Type', 'text/plain');
    }

    /**
     * Find a Flight From A to B
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function find(Request $request)
    {
        if ($request->type == 1) {
            $flights = Flight::Where('location_start',intval($request->locationStart))->where('location_end',intval($request->locationEnd))->get()->map(function ($flight) {
                $flight->planeData = $flight->plane;
                return $flight;
            });
            return $flights;
        } else if($request->type == 2) {
            $flights = Flight::Where('location_start',intval($request->locationStart))->where('location_end',intval($request->locationEnd))->get()->map(function ($flight) {
                $flight->planeData = $flight->plane;
                return $flight;
            });
            return $flights;
        } else {
            // proximamente paradas
        }
    }
}
