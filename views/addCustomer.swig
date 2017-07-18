{% extends 'layout.swig' %}
{% set title = 'Add New Customer' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
		<h1>New customer page</h1>
		
		<form method="POST">
			<label for="fname">First Name</label>
			<input type="text" id="fname"></input>

			<label for="lname">Last Name</label>
			<input type="text" id="lname"></input>

			<label for="collection">Collection</label>
			<input type="text" id="collection"></input>

			<button type="submit" id="addCustomer">Create</button>
		</form>

	</div> <!-- end right-block div -->
{% endblock %}