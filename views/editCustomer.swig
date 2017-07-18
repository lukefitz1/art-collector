{% extends 'layout.swig' %}
{% set title = 'Edit Customer' %}
{% block body %}
{% include 'sidebar.html' %}
	<h1>Edit customer</h1>

	<form method="POST">
		<label for="id">ID: </label>
		<input type="text" id="id" value="{{ cust.id }}" readonly></input>

		<label for="fname">First Name</label>
		<input type="text" id="fname" value="{{ cust.firstName }}"></input>

		<label for="lname">Last Name</label>
		<input type="text" id="lname" value="{{ cust.lastName }}"></input>

		<label for="collection">Biography</label>
		<input type="text" id="collection" value="{{ cust.collectionName }}""></input>

		<button type="submit" id="updateCustomer">Update</button>
	</form>
{% endblock %}