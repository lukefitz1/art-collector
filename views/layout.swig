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
	        var amount_paid = $('#amount_paid').val();
	        var current_value = $('#current_value').val();
	        var artist = $('#artist').val();
	        var date = $('#date').val();

	        // console.log("Obj Id: " + objid);
	        // console.log("Type: " + type);
	        // console.log("Title: " + title);
	        // console.log("Medium: " + medium);
	        // console.log("Description: " + description);
	        // console.log("Dimensions: " + dimensions);
	        // console.log("Frame: " + frame_dimensions);
	        // console.log("Condition: " + condition);
	        // console.log("Current Location: " + current_location);
	        // console.log("Source: " + source);
	        // console.log("Notes: " + notes);
	        // console.log("Amount Paid: " + amount_paid);
	        // console.log("Current Value: " + current_value);
	        // console.log("Artist: " + artist);
	        // console.log("Date: " + date);


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
	          	notes: notes,
	          	amt_paid: amount_paid,
	          	cur_val: current_location,
	          	artist: artist,
	          	date: date
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
	<script>
		$(function() {
			$('#csvImport').submit(function() {
		        var file = $('#file');
		        var name = file.val();

		        if (!isCsv(name)) {
		            return failValidation('Please select a valid csv');
		        }
			});
		});

		function failValidation(msg) {
            alert(msg); // just an alert for now but you can spice this up later
            return false;
        }

		function getExtension(filename) {
			console.log("Get Extension function");

			var parts = filename.split('.');
				return parts[parts.length - 1];
		}

		function isCsv(filename) {
			console.log("Is CSV function");

			var ext = getExtension(filename);
			switch (ext.toLowerCase()) {
				case 'csv':
				return true;
			}

			return false;
		}

	</script>
    <meta charset="utf-8">
    <title>{{ title|default('The Default Title') }}</title>
  </head>
  <body>
  	<div class="main-content">
    	{% block body %}{% endblock %}
    </div>
  </body>
</html>