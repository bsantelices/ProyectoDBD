<?php

namespace App\Http\Controllers;

use App\Plane;
use Illuminate\Http\Request;

class PlaneController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Plane::all();
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
            'brand'      => 'required|string|max:255',
            'capacity'   => 'required|integer',
            'airport_id' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        return Plane::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Plane  $plane
     * @return \Illuminate\Http\Response
     */
    public function show(Plane $plane)
    {
        return $plane;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Plane  $plane
     * @return \Illuminate\Http\Response
     */
    public function edit(Plane $plane)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Plane  $plane
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Plane $plane)
    {
        $validator = Validator::make($request->all(), [
            'brand'      => 'required|string|max:255',
            'capacity'   => 'required|integer',
            'airport_id' => 'required|integer',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $plane->update($request->all());
        $plane->save();
        return $plane;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Plane  $plane
     * @return \Illuminate\Http\Response
     */
    public function destroy(Plane $plane)
    {
        $plane->delete();
        return response('Ok', 200)
            ->header('Content-Type', 'text/plain');
    }
}
