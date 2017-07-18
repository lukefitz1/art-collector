{% extends 'layout.swig' %}
{% set title = 'Artists' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
		<h1>Artists</h1>
	
		<table class="artists-grid">

			<tr>
				<th>ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>View Page</th>
			</tr>

			{% for artist in arts %}

				<tr>
					<td>{{ artist.id }}</td>
					<td>{{ artist.firstName }}</td>
					<td>{{ artist.lastName }}</td>
					<td><a href="/artists/getArtist/{{ artist.id }}">View Artist</a></td>
				</tr>

			{% endfor %}

		</table> <!-- end artists-grid table -->

		<a href="/artists/newArtist">Add Artist</a>
	</div> <!-- end right-block div -->
{% endblock %}