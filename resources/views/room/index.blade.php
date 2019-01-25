@extends('layouts.app')
@section('content')




<section class="content">
	<div class="col-md-8 col-md-offset-2">
		<h1 style = "background-color: #FFFFFF">Habitaciones</h1>
		<form method='GET' action='/rooms'>
			{{ csrf_field() }}
			<div class="form-group">
				<label >Destino</label>
				<select name="city"  id="city" class="selectpicker">
					@foreach($locations as $location)
						<option value="{{$location['city']}}">{{$location['country']}}, {{$location['city']}}</option>
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
		
<div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab" style = "background-color: #FFFFFF">
    <thead>
        <tr>
            <th>Valor</th>
            <th>Capacidad adultos</th>
            <th>Capacidad niños</th>
            <th>Tipo de habitacion</th>
            <th>Estrellas</th>
            <th class="text-center">Comprar</th>
        </tr>
    </thead>
    @foreach($rooms as $room)
            <tr>
                <td>{{$room['value']}}</td>
                <td>{{$room['adultCapacity']}}</td>
                <td>{{$room['childrenCapacity']}}</td>
                <td>{{$room['type']}}</td>
                <td>{{$room['state']}}</td>
                <td><button>Comprar</button></td>
            </tr>
	@endforeach		
    </table>
    </div>
</div>
		
	</div>
</section>

@endsection