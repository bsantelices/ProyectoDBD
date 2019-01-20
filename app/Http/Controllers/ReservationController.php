<?php

namespace App\Http\Controllers;

use App\Reservation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Flight;
use App\Vehicle;
use App\Insurance;
use Carbon\Carbon;

class ReservationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Reservation::all();
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
        // validate data
        $validator = Validator::make($request->all(), [
            'description'       => 'required|string',
            'amount'            => 'required|integer',
            'completed'         => 'required|boolean',
            'payment_method_id' => 'required|integer',
            'flights'           => 'string',
            'vehicles'          => 'string',
            'insurances'        => 'string',
        ]);

        // if validator fails
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }

        // create the reservation
        $reservation = Reservation::create([
            'description'        => $request->description,
            'amount'             => $request->amount,
            'completed'          => $request->completed,
            'payment_method_id'  => $request->payment_method_id,
            'user_id'            => $request->user_id
        ]);

        // Vehicles for a reservation
        /*
         * EXAMPLE
         *  vehicles => "{\"1\":
         *                  {\"rent_at\": \"2019-01-20 00:12:15\",
         *                  \"return_at\": \"2019-01-20 00:12:15\"},
         *               \"2\": 
         *                  {\"rent_at\": \"2019-01-20 00:12:15\",
         *                  \"return_at\": \"2019-01-20 00:12:15\"}}"
         *
         */
        if ($request->vehicles) { 
            $vehicles = collect(json_decode($request->vehicles));
            $vehicles->map(function ($data, $vehicle_id) use ($reservation) {
                $data = collect($data);
                if (Vehicle::find($vehicle_id)) {
                    $reservation->vehicles()->attach($vehicle_id, [
                        'rent_at'   => $data["rent_at"],
                        'return_at' => $data["return_at"]
                    ]);
                }
            });
        }
        
        // Insurances for a reservation
        if ($request->insurances) { 
            $insurances = collect(json_decode($request->insurances));
            $insurances->map(function ($data, $insurance_id) use ($reservation) {
                $data = collect($data);
                if (Insurance::find($insurance_id)) {
                    $reservation->insurances()->attach($insurance_id, [
                        'start_at'   => $data["start_at"],
                        'end_at' => $data["end_at"]
                    ]);
                }
            });
        }

        // Flights for a reservation
        if ($request->flights) { 
            $flights = collect(json_decode($request->flights));
            $flights->map(function ($data, $flight_id) use ($reservation) {
                $data = collect($data);
                if (Flight::find($flight_id)) {
                    $reservation->flights()->attach($flight_id, [
                        'go_at'   => $data["go_at"],
                        'return_at' => $data["return_at"]
                    ]);
                }
            });
        }

        return $reservation;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Reservation  $reservation
     * @return \Illuminate\Http\Response
     */
    public function show(Reservation $reservation)
    {
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
        $validator = Validator::make($request->all(), [
            'description'       => 'required|string',
            'ammount'           => 'required|integer',
            'completed'         => 'required|boolean',
            'payment_method_id' => 'required|integer',
            'user_id'           => 'required|integer',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $reservation->update($request->all());
        $reservation->save();
        return $reservation;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Reservation  $reservation
     * @return \Illuminate\Http\Response
     */
    public function destroy(Reservation $reservation)
    {
        $reservation->delete();
        return response('Ok', 200)
            ->header('Content-Type', 'text/plain');
    }
}
