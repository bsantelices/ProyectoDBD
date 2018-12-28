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
        return Seat::all();
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
            'flight_id' => 'required|integer',
            'plane_id'  => 'required|integer',
            'available' => 'required|boolean',
            'code'      => 'required|string|max:255',
            'type'      => 'required|string|max:255',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        return Seat::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Seat  $seat
     * @return \Illuminate\Http\Response
     */
    public function show(Seat $seat)
    {
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
        $validator = Validator::make($request->all(), [
            'flight_id' => 'required|integer',
            'plane_id'  => 'required|integer',
            'available' => 'required|boolean',
            'code'      => 'required|string|max:255',
            'type'      => 'required|string|max:255',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $seat->update($request->all());
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
        $seat->delete();
        return response('Ok', 200)
            ->header('Content-Type', 'text/plain');
    }
}
