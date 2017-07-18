{% extends 'layout.swig' %}
{% set title = 'Add New Artist' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
		<h1>New artist page</h1>
	
		<form method="POST">
			<label for="fname">First Name</label>
			<input type="text" id="fname"></input>

			<label for="lname">Last Name</label>
			<input type="text" id="lname"></input>

			<label for="bio">Biography</label>
			<input type="text" id="bio"></input>

			<button type="submit" id="addArtist">Create</button>
		</form>

	</div> <!-- end right-block div -->
{% endblock %}