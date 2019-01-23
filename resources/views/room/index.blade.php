@extends('layouts.app')
@section('content')

<section class="content">
	<div class="col-md-8 col-md-offset-2">
		<h1>Habitaciones</h1>
		<form method='GET' action='/rooms'>
			{{ csrf_field() }}
			<div class="form-group">
				<label >Pais</label>
				<select name="country"  id="pais" class="selectpicker">
					@foreach($locations as $location)
						<option value="{{$location['id']}}">{{$location['country']}}</option>
					@endforeach
				</select>			

				<label >Ciudad</label>
				<select name="city" id="ciudad" class="selectpicker">
					@foreach($locations as $location)
						<option value="{{$location['id']}}">{{$location['city']}}</option>
					@endforeach
				</select>
			
				<label for="selectTypeRoom">Tipo de habitacion</label>
				<select class="form-control" id="selectTypeRoom" name = "typeRoom">
					  <option>basic</option>
					  <option>vip</option>
					  <option>premium</option>
				</select>

				<label for="selectTypeRoom">Capacidad de Adultos</label>
				<select class="form-control" id="selectTypeRoom" name = "adultCapacity">
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

				<label for="selectTypeRoom">Orden de precios</label>
				<select class="form-control" id="selectTypeRoom" name = "order">
					  <option>Mayor precio primero</option>
					  <option>Menor precio primero</option>
				</select>	

			<div class ="field">
					<div class = control>
						<button type="submit" class = "button is-link">Buscar</button>
					</div>
			</div>			

			</div>
		</form>

		<table class="table">
		    <thead>
		      <tr>
		        <th>Tipo habitacion</th>
		      </tr>	
		 	</thead>
		@foreach($rooms as $room)  
		    <tbody>
		    	<tr>{{$room->type}}
		    	</tr>
		    </tbody>
		</table>
		@endforeach

	</div>


</section>



@endsection