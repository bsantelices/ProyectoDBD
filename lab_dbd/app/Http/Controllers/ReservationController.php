<?php

namespace App\Http\Controllers;

use App\Reservation;
use Illuminate\Http\Request;

class ReservationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $reservation = Reservation::all();
        return $reservation; 
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
        $reservation = new Reservation();
        $reservation->amount = $request->amount;
        $reservation->description = $request->description;
        $reservation->completed = $request->completed;
        $reservation->payment_method_id = $request->payment_method_id;
        $reservation->user_id = $request->user_id;
        $reservation->save();
        $reservation = Reservation::all();
        return $reservation;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Reservation  $reservation
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $reservation = Reservation::find($id);
        return $reservation;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Reservation  $reservation
     * @return \Illuminate\Http\Response
     */
    public function edit(Reservation $reservation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Reservation  $reservation
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $reservation = Reservation::find($id);
        $reservation->amount = $request->amount;
        $reservation->description = $request->description;
        $reservation->completed = $request->completed;
        $reservation->payment_method_id = $request->payment_method_id;
        $reservation->user_id = $request->user_id;
        $reservation->save();
        return $reservation;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Reservation  $reservation
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $reservation = Reservation::find($id);
        $reservation->delete();
        return Reservation::all();
    }
}
