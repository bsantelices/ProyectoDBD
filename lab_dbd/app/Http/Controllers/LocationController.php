<?php

namespace App\Http\Controllers;

use App\Location;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $location = Location::all();
        return $location;
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
        $location = new Location();
        $location->coordinates = $request->coordinates;
        $location->city = $request->city;
        $location->country = $request->country;
        $location->street = $request->street;
        $location->houseCode = $request->houseCode;
        $location->postalCode = $request->postalCode;
        $location->save();
        $location = Location::all();
        return $location;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $location = Location($id);
        return $location;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function edit(Location $location)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $location = Location::find($id);
        $location->coordinates = $request->coordinates;
        $location->city = $request->city;
        $location->country = $request->country;
        $location->street = $request->street;
        $location->houseCode = $request->houseCode;
        $location->postalCode = $request->postalCode;
        $location->save();
        return $location;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $location = Location::find($id);
        $location->delete();
        return Location::all();
    }
}
