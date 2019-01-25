<?php

namespace App\Http\Controllers;

use App\Reservation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Flight;
use App\Room;
use App\Location;
use App\Vehicle;
use App\Insurance;
use Carbon\Carbon;
use App\Events\FillReservation;

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
            'rooms'             => 'string',
            'packages'          => 'string'
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

        // fill vehicles, flights, insurances for a reservation
        event(new FillReservation($reservation,$request));
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


    public function buyRoom(Request $request)
    {   

        $reservation = new Reservation();

        $reservation->description = "-";

        $reservation->completed = true;

        $reservation->payment_method_id = 1;

        $reservation->amount = 0;

        if(Auth::user()){
            $reservation->user_id = Auth::user()->id;
        }

        else
        {
            $reservation->user_id = 14;
        }

        $habitacion = Room::find($request->room_id);
        $habitacion->availability = false;
        $habitacion->save();


        $reservation->save();
        $reservation->rooms()->attach(intval($request->room_id),[
            'entry_at'=>Carbon::now(),
            'exit_at'=>Carbon::now()
        ]);

        $rooms = Room::orderBy('id','DESC')->availability()->get();
        $locations = Location::orderBy('id','DESC')->get();

        return view('room.index',compact('rooms','locations'));
    }  


    public function buyVehicles(Request $request)
    {   

        $reservation = new Reservation();

        $reservation->description = "-";

        $reservation->completed = true;

        $reservation->payment_method_id = 1;

        $reservation->amount = 0;

        if(Auth::user()){
            $reservation->user_id = Auth::user()->id;
        }

        else
        {
            $reservation->user_id = 14;
        }

        $car = Vehicle::find($request->vehicle_id);
        $car->availability = false;
        $car->save();


        $reservation->save();
        $reservation->vehicles()->attach(intval($request->vehicle_id),[
            'rent_at'=>Carbon::now(),
            'return_at'=>Carbon::now()
        ]);


        $vehicles = Vehicle::orderBy('id','DESC')->availability()->get();

        return view('vehicle.index',compact('vehicles'));
    } 


}
