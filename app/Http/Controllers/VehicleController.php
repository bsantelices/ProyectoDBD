<?php

namespace App\Http\Controllers;

use App\Vehicle;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VehicleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $capacity = $request->get('capacity');
        $brand = $request->get('brand');
        $model = $request->get('model');
        
        $vehicles = Vehicle::orderBy('id', 'DESC')
            ->capacity($capacity)
            ->brand($brand)
            ->model($model)
            ->availability()
            ->get();
        return view('vehicle.index', compact('vehicles'));
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
            'capacity' => 'required|integer',
            'brand'    => 'required|string|max:255',
            'model'    => 'required|string|max:255',
            'patent'   => 'required|string|max:255',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        return Vehicle::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Vehicle  $vehicle
     * @return \Illuminate\Http\Response
     */
    public function show(Vehicle $vehicle)
    {
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
    public function update(Request $request, Vehicle $vehicle)
    {
        $validator = Validator::make($request->all(), [
            'capacity' => 'required|integer',
            'brand'    => 'required|string|max:255',
            'model'    => 'required|string|max:255',
            'patent'   => 'required|string|max:255',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $vehicle->update($request->all());
        $vehicle->save();
        return $vehicle;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Vehicle  $vehicle
     * @return \Illuminate\Http\Response
     */
    public function destroy(Vehicle $vehicle)
    {
        $vehicle->delete();
        return response('Ok', 200)
            ->header('Content-Type', 'text/plain');
    }
}
