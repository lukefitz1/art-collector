{% extends 'layout.swig' %}
{% set title = 'Artist' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">

		<h1>Artist page</h1>
		<p>{{ arts.firstName }} {{ arts.lastName }}</p>
		<p>{{ arts.biography }}</p>

		<a href="/artists/editArtist/{{ arts.id }}">Update Artist</a><br />
		<a href="/artists/deleteArtist/{{ arts.id }}">Delete Artist</a><br />
		<a href="/artists/selectArt/{{ arts.id }}">Select Art</a>

		<h3>Pieces of art</h3>

		{% for art in arts.art %}
			<p>{{ art.obj_id }} - {{ art.title }}</p>
		{% endfor %}

	</div> <!-- end right-block div -->
{% endblock %}