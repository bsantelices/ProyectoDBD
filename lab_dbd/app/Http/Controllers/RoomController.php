<?php

namespace App\Http\Controllers;

use App\Room;
use Illuminate\Http\Request;

class RoomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $room = Room::all();
        return $room;
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
        $room = new Room();
        $room->value = $request->value;
        $room->state = $request->state;
        $room->adultCapacity = $request->adultCapacity;
        $room->childrenCapacity = $request->childrenCapacity;
        $room->type = $request->type;
        $room->hotel_id = $request->hotel_id;
        $room->save();
        $room = Room::all();
        return $room;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $room = Room::find($id);
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
    public function update(Request $request, $id)
    {
        $room = Room::find($id);
        $room->value = $request->value;
        $room->state = $request->state;
        $room->adultCapacity = $request->adultCapacity;
        $room->childrenCapacity = $request->childrenCapacity;
        $room->type = $request->type;
        $room->hotel_id = $request->hotel_id;
        $room->save();        
        return $room;        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Room  $room
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $room = Room::find($id);
        $room->delete();
        return Room::all();
    }
}
