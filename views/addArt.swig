{% extends 'layout.swig' %}
{% set title = 'Add New Art' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
		<h1>New art page</h1>
		
		<div class="new-art-form">

			<form method="POST">
				<div class="form-row">
					<label for="obj_id">ID</label>
					<input type="text" id="obj_id"></input>

					<label for="type">Type of art</label>
					<input type="text" id="type"></input>
				</div>

				<div class="form-row">
					<label for="title">Title</label>
					<input type="text" id="title"></input>

					<!--<label for="artist">Artist</label>
					<input type="text" id="artist"></input>-->
				</div>

				<div class="form-row">
					<label for="date">Date</label>
					<input type="text" id="date"></input>

					<label for="medium">Medium</label>
					<input type="text" id="medium"></input>
				</div>

				<div class="form-row">
					<label for="description">Description</label>
					<input type="text" id="description"></input>

					<label for="dimensions">Dimensions</label>
					<input type="text" id="dimensions"></input>
				</div>

				<div class="form-row">
					<label for="frame_dimensions">Frame Dimensions</label>
					<input type="text" id="frame_dimensions"></input>

					<label for="condition">Condition</label>
					<input type="text" id="condition"></input>
				</div>

				<div class="form-row">
					<label for="current_location">Current Location</label>
					<input type="text" id="current_location"></input>

					<label for="source">Source</label>
					<input type="text" id="source"></input>
				</div>

				<div class="form-row">
					<label for="amount_paid">Amount Paid</label>
					<input type="text" id="amount_paid"></input>

					<label for="current_value">Current Value</label>
					<input type="text" id="current_value"></input>
				</div>

				<div class="form-row">
					<label for="notes">Notes</label>
					<input type="text" id="notes"></input>
				</div>

				<button type="submit" id="addArt">Create</button>
			</form>

		</div>
		
	</div> <!-- end right-block div -->
{% endblock %}