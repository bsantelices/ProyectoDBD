<?php

namespace App\Http\Controllers;

use App\Airport;
use Illuminate\Http\Request;

class AirportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $airport = Airport::all();
        return $airport;
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
        $airport = new Airport();
        $airport->names = $request->names;
        $airport->type = $request->type;
        $airport->location_id = $request->location_id;
        $airport->save();
        $airport = Airport::all();
        return $airport;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $airport = Airport::find($id);
        return $airport;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function edit(Airport $airport)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $airport = Airport::find($id);
        $airport->names = $request->names;
        $airport->type = $request->type;
        $airport->location_id = $request->location_id;
        $airport->save();
        return $airport;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $airport = Airport::find($id);
        $airport->delete();
        return Airport::all();
    }
}
