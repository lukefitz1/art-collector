{% extends 'layout.swig' %}
{% set title = 'Edit Artwork' %}
{% block body %}
{% include 'sidebar.html' %}
	<h1>Edit art - {{ art.title }} </h1>

	<form method="POST">
		<label for="id">ID: </label>
		<input type="text" id="id" value="{{ art.id }}" readonly></input>

		<label for="obj_id">Obj ID: </label>
		<input type="text" id="obj_id" value="{{ art.obj_id }}" ></input>

		<label for="type">Type of art</label>
		<input type="text" id="type" value="{{ art.type }}" ></input>

		<label for="title">Title</label>
		<input type="text" id="title" value="{{ art.title }}" ></input>

		<label for="medium">Medium</label>
		<input type="text" id="medium" value="{{ art.medium }}" ></input>

		<label for="description">Description</label>
		<textarea rows="3" cols="50" type="text" id="description">{{ art.description }}</textarea>

		<label for="dimensions">Dimensions</label>
		<input type="text" id="dimensions" value="{{ art.dimensions }}" ></input>

		<label for="frame_dimensions">Frame Dimensions</label>
		<input type="text" id="frame_dimensions" value="{{ art.frame_dimensions }}" ></input>

		<label for="condition">Condition</label>
		<input type="text" id="condition" value="{{ art.condition }}" ></input>

		<label for="current_location">Current Location</label>
		<input type="text" id="current_location" "current_location"></input>

		<label for="source">Source</label>
		<input type="text" id="source" value="{{ art.source }}" ></input>

		<label for="notes">Notes</label>
		<textarea rows="3" cols="50" type="text" id="notes">{{ art.notes }}</textarea>

		<button type="submit" id="updateArt">Update</button>
	</form>
{% endblock %}