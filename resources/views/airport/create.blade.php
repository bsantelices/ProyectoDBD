@extends('layouts.app')
@section('content')
	<section class="content">
		<div class="col-md-8 col-md-offset-2">

		<h1 class="title">Crear aeropuerto</h1>
		<form method= "POST" action = "/airports" >
			{{csrf_field() }}
			<div>
				<input class="form-control" name = "name" type="text" placeholder="Nombre aeropuerto">
			</div>
			<div class="form-group">
			<label for="selectAirport">Tipo de aeropuerto</label>
			<select class="form-control" id="selectAirport" name = "type">
			  <option>national</option>
			  <option>international</option>
			</select>

			<!-- 	Falta relacionar los 3 elementos entre si, pais -> ciudades -> calles 
					Retorna numero en vez de nombre. -->

			<div class="form-group">
				<label >Pais</label>
				<select name="country" id="pais" class="form-control">
					@foreach($locations as $location)
						<option value="{{$location['id']}}">{{$location['country']}}</option>
					@endforeach
				</select>
			
				<label >Ciudad</label>
				<select name="city" id="ciudad" class="form-control">
					@foreach($locations as $location)
						<option value="{{$location['id']}}">{{$location['city']}}</option>
					@endforeach
				</select>

				<label >Street</label>
				<select name="street" id="calle" class="form-control">
					@foreach($locations as $location)
						<option value="{{$location['id']}}">{{$location['street']}}</option>
					@endforeach
				</select>
				<div class ="field">
					<div class = control>
						<button type="submit" class = "button is-link">Agregar aeropuerto</button>
					</div>
								

					@if (\Session::has('fail'))
					<div class="alert alert-success">
					    <ul>		
					        <li>{!! \Session::get('fail') !!}</li>
					    </ul>
					</div>
					@endif

				</div>
			</div>
		</form>
		</div>
	</section>



@endsection