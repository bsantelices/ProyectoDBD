@extends('layouts.app')

@section('content')
    <home-component :locations="{{ $locations }}"/>
@endsection
