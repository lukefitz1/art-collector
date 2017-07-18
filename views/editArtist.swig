{% extends 'layout.swig' %}
{% set title = 'Edit Artist' %}
{% block body %}
{% include 'sidebar.html' %}
	<h1>Edit artist</h1>

	<form method="POST">
		<label for="id">ID: </label>
		<input type="text" id="id" value="{{ arts.id }}" readonly></input>

		<label for="fname">First Name</label>
		<input type="text" id="fname" value="{{ arts.firstName }}"></input>

		<label for="lname">Last Name</label>
		<input type="text" id="lname" value="{{ arts.lastName }}"></input>

		<label for="bio">Biography</label>
		<textarea rows="3" cols="50" type="text" id="bio">{{ arts.biography }}</textarea>

		<button type="submit" id="updateArtist">Update</button>
	</form>
{% endblock %}