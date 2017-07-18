{% extends 'layout.swig' %}
{% set title = 'Customer' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
		<h1>Customer page</h1>
		<input class="hide" id="custId" value="{{ cust.id }}" readonly></input>
		<p>{{ cust.firstName }} {{ cust.lastName }}</p>
		<p>{{ cust.collectionName }}</p>

		<a href="/customers/editCustomer/{{ cust.id }}">Update Customer</a><br />
		<a href="/customers/deleteCustomer/{{ cust.id }}">Delete Customer</a><br />
		<a href="/customers/selectArt/{{ cust.id }}">Select Art</a>

		<h3>Pieces of art</h3>

		<form method="POST">
			<table class="customer-art">

				<tr>
					<th>Object ID</th>
					<th>Artwork</th>
					<th>View Page</th>
				</tr>

				{% for art in cust.art %}
					<!-- <input class="hide" id="artId-{{ art.id }}" value="{{ art.id }}" readonly></input> -->

					<tr>
						<td>{{ art.obj_id }}</td>
						<td>{{ art.title }}</td>
						<td><input type="button" class='btn' value="View Artwork" data-customer="{{ cust.id }}" data-art="{{ art.id }}"></input></td>
					</tr>


				{% endfor %}

			</table> <!-- end customer-art table -->
		</form>

	</div> <!-- end right-block div -->
{% endblock %}