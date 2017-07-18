{% extends 'layout.swig' %}
{% set title = 'Customer' %}
{% block body %}
{% include 'sidebar.html' %}
	<div class="right-block">
		<h1>Import a file</h1>
		
		<form id="csvImport" method="post" action="/art/fileUpload" enctype="multipart/form-data">
		  <input type="file" name="csv" accept="csv" id="file">
		  <input type="submit">
		</form>
	</div> <!-- end right-block div -->
{% endblock %}