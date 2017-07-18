{% extends 'layout.swig' %}
{% set title = 'Pieces of Art' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
  		<h1>Artwork</h1>

  		<table class="artwork-grid">

			<tr>
				<th>ID</th>
				<th>Object ID</th>
				<th>Title</th>
				<th>Medium</th>
				<th>View Page</th>
			</tr>

			{% for arts in art %}

				<tr>
					<td>{{ arts.id }}</td>
					<td>{{ arts.obj_id }}</td>
					<td>{{ arts.title }}</td>
					<td>{{ arts.medium }}</td>
					<td><a href="/art/getArt/{{ arts.id }}">View Art</a></td>
				</tr>

			{% endfor %}

		</table> <!-- end artwork-grid table -->

		<a href="/art/newArt">Add Artwork</a>
		<a href="/art/fileImport">Import CSV file</a>
		
	</div> <!-- end right-block div -->
{% endblock %}