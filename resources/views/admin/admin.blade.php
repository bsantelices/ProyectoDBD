@extends('layouts.app')

@section('content')
   <admin-component
   		:admin="{{ $admin }}"
   		:packages="{{ $packages }}"
   		:flights="{{ $flights }}"
   		:vehicles="{{ $vehicles }}"
   		:roles="{{ $roles }}"
   		:insurances="{{ $insurances }}"
   		:discounts="{{ $discounts }}"
   		:locations="{{ $locations }}"
         :planes="{{ $planes }}"
         :airports="{{ $airports }}"
   	/>
@endsection
