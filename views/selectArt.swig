{% extends 'layout.swig' %}
{% set title = 'Select Art for Customer' %}
{% block body %}
	<h1>Choose Art for {{ cust.firstName }} {{ cust.lastName }}</h1>
	<form method="POST">
		<label for="id">ID: </label>
		<input class="hide" id="id" value="{{ cust.id }}" readonly></input>
		
		<h3>Already selected art</h3>
		{% for art in cust.art %}
			<p>{{ art.id }} - {{ art.obj_id }} - {{ art.title }}</p>
		{% endfor %}

		<h3>All art</h3>
		<div class="available-art blue">
			{% for art in art %}
				<input type="checkbox" name="art" value="{{ art.id }}">{{ art.id }} - {{ art.obj_id }} - {{ art.title }}<br />
			{% endfor %}
		</div>

		<button type="submit" id="selectArt">Select</button>
	</form>

{% endblock %}