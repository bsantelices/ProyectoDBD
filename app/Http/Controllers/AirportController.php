<?php

namespace App\Http\Controllers;

use App\Airport;
use App\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class AirportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $airports = Airport::all();
        return view('airport.index',compact($airports));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $locations = Location::all();
        return view('airport.create',compact('locations'));
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
            'name'          => 'required|string|max:255',
            'type'          => 'required|string',
            'country'       => 'required|string',
            'city'          => 'required|string',
            'street'        => 'required|string'
        ]);
        if ($validator->fails()) {
            return redirect()
                    ->back()
                    ->with('fail', 'Fallo: Asegurese de llenar todos los campos'); 
        }
        else
        {
            $airport = new Airport();
            $airport->name = $request->get('name');
            $airport->type = $request->get('type');
            $locations = Location::all();
            $locationA = $locations->where('country','country');
            $locationB = $locationA->where('city','city');
            $locationC = $locationB->where('street','street');

            if($locationC->get('id') == null)
            {
                return redirect()
                        ->back()
                        ->with('fail', 'Fallo: Datos de lugar invalidos'); 
            }
            else
            {
                $airport->location_id = $locationC->get('id');
                $airport->save();
                return redirect('/airports');
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function show(Airport $airport)
    {
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

        return view('airport.edit');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Airport $airport)
    {
        $validator = Validator::make($request->all(), [
            'name'          => 'required|string|max:255',
            'type'          => 'required|string|max:255',
            'location_id'   => 'required|integer',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $airport->update($request->all());
        $airport->save();
        return $airport;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function destroy(Airport $airport)
    {
        $airport->delete();
        return response('Ok', 200)
            ->header('Content-Type', 'text/plain');
    }
}
