<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\User;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::all();
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
            'moneyAmount' => 'required|integer',
            'name'        => 'required|string|max:255',
            'lastname'    => 'required|string|max:255',
            'dni'         => 'required|string|max:255',
            'email'       => 'required|string|max:255|email',
            'username'    => 'required|string|max:255|unique',
            'password'    => 'required|string',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        return User::create([
            'moneyAmount' => $request->moneyAmount,
            'name'        => $request->name,
            'lastname'    => $request->lastname,
            'dni'         => $request->dni,
            'email'       => $request->email,
            'username'    => $request->username,
            'password'    => Hash::make($request->password)
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        return $user;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        $validator = Validator::make($request->all(), [
            'moneyAmount' => 'required|integer',
            'name'        => 'required|string|max:255',
            'lastname'    => 'required|string|max:255',
            'dni'         => 'required|string|max:255',
            'email'       => 'required|string|max:255|email',
            'username'    => 'required|string|max:255|unique',
            'password'    => 'required|string',
        ]);
        if ($validator->fails()) {
            return redirect('/home')
                ->withErrors($validator)
                ->withInput();
        }
        $user->update([
            'moneyAmount' => $request->moneyAmount,
            'name'        => $request->name,
            'lastname'    => $request->lastname,
            'dni'         => $request->dni,
            'email'       => $request->email,
            'username'    => $request->username,
            'password'    => Hash::make($request->password)
        ]);  
        $user->save();
        return $user;    
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();
        return response('Ok', 200)
            ->header('Content-Type', 'text/plain');
    }
}
