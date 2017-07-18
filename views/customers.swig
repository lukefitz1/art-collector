{% extends 'layout.swig' %}
{% set title = 'Customers' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
		<h1>Customers</h1>

		<table class="customers-grid">

			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Collection</th>
				<th>View Page</th>
			</tr>
			
			{% for customer in cust %}

				<tr>
					<td>{{ customer.id }}</td>
					<td>{{ customer.firstName }}</td>
					<td>{{ customer.lastName }}</td>
					<td>{{ customer.collectionName }}</td>
					<td><a href="/customers/getCustomer/{{ customer.id }}">View Customer</a></td>
				</tr>
			
			{% endfor %}

		</table> <!-- end customers-grid table -->

		<a href="/customers/newCustomer">Add Customer</a>
	</div> <!-- end right-block div -->
{% endblock %}