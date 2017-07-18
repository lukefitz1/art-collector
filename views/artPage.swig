{% extends 'layout.swig' %}
{% set title = 'Pieces of Art' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
  		<h1>Art - {{ art.title }} </h1>

		<p>ID: {{ art.id }}</p>
		<p>Obj ID: {{ art.obj_id }}</p>
		<p>Medium: {{ art.medium }}</p>
		<p>Artist: {{ art.artist }}</p>

		<a href="/art/editArt/{{ art.id }}">Update Art</a><br />
		<a href="/art/deleteArt/{{ art.id }}">Delete Artwork</a>

	</div> <!-- end right-block div -->
{% endblock %}