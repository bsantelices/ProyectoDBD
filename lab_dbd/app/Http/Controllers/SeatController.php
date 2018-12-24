<?php

namespace App\Http\Controllers;

use App\Seat;
use Illuminate\Http\Request;

class SeatController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $seat = Seat::all();
        return $seat;
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
        $seat = new Seat();
        $seat->code = $request->code;
        $seat->type = $request->type;
        $seat->available = $request->available;
        $seat->flight_id = $request->flight_id;
        $seat->plane_id = $request->plane_id;
        $seat->save();
        $seat = Seat::all();
        return $seat;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Seat  $seat
     * @return \Illuminate\Http\Response
     */
    public function show(Seat $seat)
    {
        $seat = Seat::find($id);
        return $seat;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Seat  $seat
     * @return \Illuminate\Http\Response
     */
    public function edit(Seat $seat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Seat  $seat
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Seat $seat)
    {
        $seat = Seat::find($id);
        $seat->code = $request->code;
        $seat->type = $request->type;
        $seat->available = $request->available;
        $seat->flight_id = $request->flight_id;
        $seat->plane_id = $request->plane_id;
        $seat->save();        
        return $seat;        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Seat  $seat
     * @return \Illuminate\Http\Response
     */
    public function destroy(Seat $seat)
    {
        $seat = Seat::find($id);
        $seat->delete();
        return Seat::all();
    }
}
