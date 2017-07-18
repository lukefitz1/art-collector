{% extends 'layout.swig' %}
{% set title = 'Select Art for Artist' %}
{% block body %}
{% include 'sidebar.html' %}
	<h1>Choose Art for {{ artist.firstName }} {{ artist.lastName }}</h1>
	<form method="POST">
		<label for="id">ID: </label>
		<input class="hide" id="id" value="{{ artist.id }}" readonly>{{ artist.id }}</input><br /><br />
		
		<h3>Already selected art</h3>
		{% for art in artist.art %}
			<p>{{ art.id }} - {{ art.obj_id }} - {{ art.title }}</p>
		{% endfor %}

		<h3>All art</h3>
		<div class="available-art blue">
			{% for art in art %}
				<input type="checkbox" name="art" value="{{ art.id }}">{{ art.id }} - {{ art.obj_id }} - {{ art.title }}<br />
			{% endfor %}
		</div>

		<button type="submit" id="selectArtForArtist">Select</button>
	</form>

{% endblock %}