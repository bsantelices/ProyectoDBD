<?php

namespace App\Http\Controllers;

use App\Log;
use Illuminate\Http\Request;

class LogController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $log = Log::all();
        return $log;
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
        $log = new Log();
        $log->transactionCode = $request->transactionCode;
        $log->title = $request->title;
        $log->description = $request->description;
        $log->user_id = $request->user_id;
        $log->payment_method_id = $request->payment_method_id;
        $log->save();
        $log = Log::all();
        return $log;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Log  $log
     * @return \Illuminate\Http\Response
     */
    public function show(Log $log)
    {
        $log = Log::find($id);
        return $log;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Log  $log
     * @return \Illuminate\Http\Response
     */
    public function edit(Log $log)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Log  $log
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Log $log)
    {
        $log = Log::find($id);
        $log->transactionCode = $request->transactionCode;
        $log->title = $request->title;
        $log->description = $request->description;
        $log->user_id = $request->user_id;
        $log->payment_method_id = $request->payment_method_id;
        $log->save();
        return $log;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Log  $log
     * @return \Illuminate\Http\Response
     */
    public function destroy(Log $log)
    {
        $log = Log::find($id);
        $log->delete();
        return Log::all();
    }
}
