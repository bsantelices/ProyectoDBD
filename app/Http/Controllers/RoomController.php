<?php

namespace App\Http\Controllers;

use App\Room;
use App\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RoomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $locations = Location::all();

            $city =             $request->get('city');
            $type =             $request->get('typeRoom');
            $adultCapacity =    $request->get('adultCapacity');
            $childrenCapacity = $request->get('childrenCapacity');
            $state =            $request->get('state');

            $rooms = Room::orderBy('id','DESC')
                        ->type($type)
                        ->adultCapacity($adultCapacity)
                        ->childrenCapacity($childrenCapacity)
                        ->state($state)
                        ->city($city)
                        ->availability()
                        ->get();
            return view('room.index',compact('rooms', 'locations'));
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
            'value'            => 'required|integer',
            'state'            => 'required|integer',
            'adultCapacity'    => 'required|integer',
            'childrenCapacity' => 'required|integer',
            'type'             => 'required|string|max:255',
            'hotel_id'         => 'required|integer',
            'availability'     => 'required|boolean'
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        return Room::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function show(Room $room)
    {
        return $room;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function edit(Room $room)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Room $room)
    {
        $validator = Validator::make($request->all(), [
            'value'            => 'required|integer',
            'state'            => 'required|integer',
            'adultCapacity'    => 'required|integer',
            'childrenCapacity' => 'required|integer',
            'type'             => 'required|string|max:255',
            'hotel_id'         => 'required|integer',
            'availability'     => 'required|boolean'
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $room->update($request->all());
        $room->save();        
        return $room;        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function destroy(Room $room)
    {
        $room->delete();
        return response('Ok', 200)
            ->header('Content-Type', 'text/plain');
    }


}
