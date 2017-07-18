<!DOCTYPE html>
<html lang="en">
  <head>

  <link rel="stylesheet" href="/styles/pdf-template.css">
  <link rel="stylesheet" href="/styles/styles.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script>
	$(document).ready(function(){
	    $("#addArtist").click(function(){
	        var fn = $('#fname').val();
	        var ln = $('#lname').val();
	        var biography = $('#bio').val();

	        $.post("/artists/addArtist",
	        {
	          fname: fn,
	          lname: ln,
	          bio: biography
	        });
	    });
	});
	</script>
	<script>
	$(document).ready(function(){
	    $("#addCustomer").click(function(){
	        var fn = $('#fname').val();
	        var ln = $('#lname').val();
	        var collect = $('#collection').val();

	        $.post("/customers/addCustomer",
	        {
	          fname: fn,
	          lname: ln,
	          collection: collect
	        });
	    });
	});
	</script>
	<script>
	$(document).ready(function(){
	    $("#addArt").click(function(){
	        var objid = $('#obj_id').val();
	        var type = $('#type').val();
	        var title = $('#title').val();
	        var medium = $('#medium').val();
	        var description = $('#description').val();
	        var dimensions = $('#dimensions').val();
	        var frame_dimensions = $('#frame_dimensions').val();
	        var condition = $('#condition').val();
	        var current_location = $('#current_location').val();
	        var source = $('#source').val();
	        var notes = $('#notes').val();

	        $.post("/art/addArt",
	        {
	          	obj_id: objid,
	          	type: type,
	          	title: title,
	          	medium: medium,
	          	description: description,
	          	dimensions: dimensions,
	          	frame_dimensions: frame_dimensions,
	          	condition: condition,
	          	current_location: current_location,
	          	source: source,
	          	notes: notes
	        });
	    });
	});
	</script>
	<script>
	$(document).ready(function() {
		$('#updateArtist').click(function() {
			var idNum = $('#id').val();
			var fn = $('#fname').val();
	        var ln = $('#lname').val();
	        var biography = $('#bio').val();

			$.post("/artists/updateArtist",
	        {
	          id: idNum,
	          fname: fn,
	          lname: ln,
	          bio: biography
	        });
		});
	});
	</script>
	<script>
	$(document).ready(function() {
		$('#updateArt').click(function() {
			var idNum = $('#id').val();
			var objid = $('#obj_id').val();
	        var type = $('#type').val();
	        var title = $('#title').val();
	        var medium = $('#medium').val();
	        var description = $('#description').val();
	        var dimensions = $('#dimensions').val();
	        var frame_dimensions = $('#frame_dimensions').val();
	        var condition = $('#condition').val();
	        var current_location = $('#current_location').val();
	        var source = $('#source').val();
	        var notes = $('#notes').val();

			$.post("/art/updateArt",
	        {
				id: idNum,
				obj_id: objid,
				type: type,
				title: title,
				medium: medium,
				description: description,
				dimensions: dimensions,
				frame_dimensions: frame_dimensions,
				condition: condition,
				current_location: current_location,
				source: source,
				notes: notes
	        });
		});
	});
	</script>
	<script>
	$(document).ready(function() {
		$('#updateCustomer').click(function() {
			var idNum = $('#id').val();
			var fn = $('#fname').val();
	        var ln = $('#lname').val();
	        var collect = $('#collection').val();

			$.post("/customers/updateCustomer",
	        {
	          id: idNum,
	          fname: fn,
	          lname: ln,
	          collection: collect
	          
	        });
		});
	});
	</script>
	<script>
	$(document).ready(function() {
		var selected = new Array();

		$('#selectArt').click(function() {
			var idNum = $('#id').val();

			$(":checked").each(function() {
				selected.push($(this).val());
			});

			$.post("/customers/connectArt", 
			{
				id: idNum,
				arr: selected
			});
		});
	});
	</script>
	<script>
	$(document).ready(function() {
		var selected = new Array();

		$('#selectArtForArtist').click(function() {
			var idNum = $('#id').val();

			$(":checked").each(function() {
				selected.push($(this).val());
			});

			$.post("/artists/connectArt", 
			{
				id: idNum,
				arr: selected
			});
		});
	});
	</script>
	<script>
		$(document).on('click', '.btn', function() {
			var custId = $(this).data('customer');
			var artId = $(this).data('art');

			//console.log("Layout - Customer ID: " + custId);
			//console.log("Layout - Art ID: " + artId);

			if(custId && artId) {
				window.location = "/art/getArtPage?artID=" + artId + "&customerID=" + custId;
			}
		});
	</script>
    <meta charset="utf-8">
    <title>{{ title|default('The Default Title') }}</title>
  </head>
  <body>
	{% block body %}{% endblock %}
  </body>
</html>