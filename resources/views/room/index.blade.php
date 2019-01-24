@extends('layouts.app')
@section('content')

<section class="content">
	<div class="col-md-8 col-md-offset-2">
		<h1>Habitaciones</h1>
		<form method='GET' action='/rooms'>
			{{ csrf_field() }}
			<div class="form-group">
				<label >Pais</label>
				<select name="country"  id="country" class="selectpicker" value = "{{old('country')}}">
					@foreach($locations as $location)
						<option value="{{$location['country']}}">{{$location['country']}}</option>
					@endforeach
				</select>			

				<label >Ciudad</label>
				<select name="city" id="ciudad" class="selectpicker">
					@foreach($locations as $location)
						<option value="{{$location['city']}}">{{$location['city']}}</option>
					@endforeach
				</select>
			
				<label for="typeRoom">Tipo de habitacion</label>
				<select class="form-control" id="typeRoom" name = "typeRoom">
					  <option value ="basic">Basico</option>
					  <option value = "vip">Vip</option>
					  <option value = "premium">Premium</option>
				</select>

				<label for="adultCapacity">Capacidad de Adultos</label>
				<select class="form-control" id="adultCapacity" name = "adultCapacity">
					  <option>1</option>
					  <option>2</option>
					  <option>3</option>
					  <option>4</option>
					  <option>5</option>
				</select>

				<label for="selectTypeRoom">Capacidad de Niños</label>
				<select class="form-control" id="selectTypeRoom" name = "childrenCapacity">
					  <option>1</option>
					  <option>2</option>
					  <option>3</option>
					  <option>4</option>
					  <option>5</option>
				</select>	

				<label for="selectTypeRoom">Estrellas</label>
				<select class="form-control" id="selectTypeRoom" name = "state">
					  <option>1</option>
					  <option>2</option>
					  <option>3</option>
					  <option>4</option>
					  <option>5</option>
				</select>						

			<div class ="field">
					<div class = control>
						<button type="submit" class = "button is-link">Buscar</button>
					</div>
			</div>			

			</div>
		</form>

		@foreach($rooms as $room)
			<?php 	$hotel = App\Hotel::find($room->hotel_id);
					$location = App\Location::find($hotel->location_id);
			?>
				<h1>{{$room['type']}}</h1>
		@endforeach			
	 
		

	</div>


</section>



@endsection