<?php

namespace App\Http\Controllers;

use App\Insurance;
use Illuminate\Http\Request;

class InsuranceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $insurance = Insurance::all();
        return $insurance;
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
        $insurance = new Insurance();
        $insurance->value = $request->value;
        $insurance->type = $request->type;
        $insurance->save();
        $insurance = Insurance::all();
        return $insurance;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Insurance  $insurance
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $insurance = Insurance::find($id);
        return $insurance;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Insurance  $insurance
     * @return \Illuminate\Http\Response
     */
    public function edit(Insurance $insurance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Insurance  $insurance
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $insurance = Insurance::find($id);
        $insurance->value = $request->value;
        $insurance->type = $request->type;
        $insurance->save();
        return $insurance;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Insurance  $insurance
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $insurance = Insurance::find($id);
        $insurance->delete();
        return Insurance::all();
    }
}
