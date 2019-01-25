@extends('layouts.app')

@section('content')
    <home-component :locations="{{ $locations }}" :auth="{{ Auth::user() }}"/>
@endsection
