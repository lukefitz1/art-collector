/**
 * ArtController
 *
 * @description :: Server-side logic for managing arts
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	index: function(request, response) {
		Art.find({})
			.then(function (arts) {
				return response.view('art', {
					art: arts
				});
			})
			.catch(function (err) {
				console.log(err);
				response.status(500)
					.json({error: err});
			});
	},

	getArts: function(request, response) {
		Art.find({})
			.then(function (arts) {
				return response.view('art', {
					art: arts
				});
			})
			.catch(function (err) {
				console.log(err);
				response.status(500)
					.json({error: err});
			});
	},

	getArt: function(request, response) {
		Art.findOne(request.param('id')).exec(function(err, arts) {
			return response.view('artPage', {
				art: arts
			});
		});
	},

	newArt: function(request, response) {
		return response.view('addArt', {});
	},

	addArt: function(request, response) {
		var objid = request.param('obj_id');
        var type = request.param('type');
        var title = request.param('title');
        var medium = request.param('medium');
        var description = request.param('description');
        var dimensions = request.param('dimensions');
        var frame_dimensions = request.param('frame_dimensions');
        var condition = request.param('condition');
        var current_location = request.param('current_location');
        var source = request.param('source');
        var notes = request.param('notes');
        var amount_paid = request.param('amt_paid');
        var current_value = request.param('cur_val');
        var artist = request.param('artist');
        var date = request.param('date');

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

		Art.create({
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
			amount_paid: amount_paid,
			current_value: current_value,
			date_acquired: date,
			// artist: artist
		}).exec(function (err, cust) {
			if (err) { return response.serverError(err); }
			return response.ok();
		});
	},

	editArt: function(request, response) {
		Art.findOne(request.param('id')).exec(function foundUser(err, user) {
			return response.view('editArt', {
				art: user
			});
		});
	},

	updateArt: function(request, response) {
		var id = request.param('id');
		var objid = request.param('obj_id');
        var type = request.param('type');
        var title = request.param('title');
        var medium = request.param('medium');
        var description = request.param('description');
        var dimensions = request.param('dimensions');
        var frame_dimensions = request.param('frame_dimensions');
        var condition = request.param('condition');
        var current_location = request.param('current_location');
        var source = request.param('source');
        var notes = request.param('notes');

		Art.update({id: id}, {
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
		}).exec(function(err, artist) {
			if (err) { return response.serverError(err); }
			return response.ok();
		});
	},

	deleteArt: function(request, response) {
		Art.destroy(request.param('id')).exec(function(err, art) {
			if (err) { return response.serverError(err); }
		});

		response.redirect("/art/getArts");
	},

	getArtPage: function(request, response) {
		var values = request.allParams();

		//console.log("Art ID: " + values.artID);
		//console.log("Customer ID: " + values.customerID);
		
		Art.findOne(values.artID).populate('artist').exec(function foundArt(err, artwork) {
			if (err) { return response.serverError(err); }

			console.log(artwork);
			
			Customer.findOne(values.customerID).exec(function foundCustomer(err, customer) {
				if (err) { return response.serverError(err); }

				return response.view('artTemplate', {
					art: artwork,
					cust: customer
				});

			});
		});
	},

	fileImport: function(request, response) {
		return response.view('fileImport', {});
	},

	fileUpload: function(request, response) {
		request.file('csv').upload({
			dirname: require('path').resolve(sails.config.appPath, 'assets/csv')
		}, function whenDone(err, uploadedFiles) {
			//console.log("Upload function");
			//console.log("Uploaded files: " + uploadedFiles[0].fd);
			//console.log("Uploaded files length: " + uploadedFiles.length)

			if (err) {
				return response.negotiate(err);
			}

			if (uploadedFiles.length === 0){
			  return response.badRequest('No file was uploaded');
			}

			//var importObj = csvParser.parseCsv(uploadedFiles[0].fd);
			//console.log("Import Object: " + importObj);

			// csvParser.parseCsv(uploadedFiles[0].fd).then(function(importObj) {
			// 	console.log("HEYHEYHEYHHEY")
			// })

			/*csvParser.parseCsv(uploadedFiles[0].fd).then(function(data) {
				console.log("Data: " + data);
				console.log("HEYHEYHEYHHEY");
			})*/

			csvParser.promisePractice("test string").then(function(data) {
				console.log(data);
			})

			return response.json({
	        	files: uploadedFiles[0],
	        	//textParams: request.allParams()
	      	});
		});
	},

	artImport: function(jsonObj) {
		console.log("Art import function!");
	}

};