@extends('layouts.app')
@section('content')




<section class="content">
	<div class="col-md-8 col-md-offset-2">
		<h1 style = "background-color: #FFFFFF">Vehiculos</h1>
		<form method='GET' action='/vehicles'>
			{{ csrf_field() }}
			<div class="form-group">
				<label for="capacity">Capacidad</label>
				<select class="form-control" id="capacity" name = "capacity">
					  <option>1</option>
                      <option>2</option>
                      <option>3</option>
					  <option>4</option>
					  <option>5</option>
				</select>

				<label for="model">Model</label>
				<select class="form-control"  id="model" name="model">
					@foreach($vehicles as $vehicle)
						<option value="{{$vehicle['model']}}">{{$vehicle['model']}}</option>
					@endforeach
				</select>	
                
                <label >Marca</label>
				<select class="form-control"  id="brand" name="brand">
					@foreach($vehicles as $vehicle)
					<option value="{{$vehicle['brand']}}">{{$vehicle['brand']}}</option>
					@endforeach
					</select>

                <label >Patente</label>
				<select class="form-control"  id="patent" name="patent">
					@foreach($vehicles as $vehicle)
					<option value="{{$vehicle['patent']}}">{{$vehicle['patent']}}</option>
					@endforeach
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
            <th>Capacidad</th>
            <th>Modelo</th>
            <th>Marca</th>
            <th>Patente</th>
            <th class="text-center">Comprar</th>
        </tr>
    </thead>
    @foreach($vehicles as $vehicle)
            <tr>
                <td>{{$vehicle['capacity']}}</td>
                <td>{{$vehicle['model']}}</td>
                <td>{{$vehicle['brand']}}</td>
                <td>{{$vehicle['patent']}}</td>
				<td>
            	<form method='POST' action=" {{ route('buyVehicles') }}">
            		{{ csrf_field() }}
            		<input style="display: none;" type="number" name="vehicle_id" value="{{$vehicle->id}}">
            		<button type = "submit">Comprar</button>
            	</form>
            </td>
            </tr>
	@endforeach		
    </table>
    </div>
</div>
		
	</div>
</section>

@endsection