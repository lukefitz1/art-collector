/**
 * ArtistsController
 *
 * @description :: Server-side logic for managing artists
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	index: function(request, response) {
		Artists.find({})
			.then(function (artists) {
				return response.view('artists', {
					arts: artists 
				});
			})
			.catch(function (err) {
				console.log(err);
				response.status(500)
					.json({error: err});
			});
	},

	getArtists: function(request, response) {
		Artists.find({})
			.then(function (artists) {
				return response.view('artists', {
					arts: artists 
				});
			})
			.catch(function (err) {
				console.log(err);
				response.status(500)
					.json({error: err});
			});
	},

	getArtist: function(request, response) {
		Artists.findOne(request.param('id')).populate('art').exec(function foundUser(err, user) {
			return response.view('artist', {
				arts: user
			});
		});
			
	},

	newArtist: function(request, response) {
		return response.view('addArtist', {});
	},

	addArtist: function(request, response) {
		var fn = request.param("fname");
		var ln = request.param("lname");
		var bio = request.param("bio");

		Artists.create({firstName: fn, lastName: ln, biography: bio}).exec(function (err, artist) {
			if (err) { return response.serverError(err); }
			return response.ok();
		});
	},

	editArtist: function(request, response) {
		Artists.findOne(request.param('id')).exec(function foundUser(err, user) {
			return response.view('editArtist', {
				arts: user
			});
		});
	},

	updateArtist: function(request, response) {
		var id = request.param("id");
		var fn = request.param("fname");
		var ln = request.param("lname");
		var bio = request.param("bio");

		Artists.update({id: id}, {firstName: fn, lastName: ln, biography: bio}).exec(function(err, artist) {
			if (err) { return response.serverError(err); }
			return response.ok();
		});
	},

	deleteArtist: function(request, response) {
		Artists.destroy(request.param('id')).exec(function(err, art) {
			if (err) { return response.serverError(err); }
		});

		response.redirect("/artists/getArtists");
	},

	selectArt: function(request, response) {
		Artists.findOne(request.param('id')).populate('art').exec(function foundUser(err, user) {

			Art.find({})
			.then(function (arts) {
				var notMatch = new Array();
				var noMatchObj = new Array();

				if (typeof user.art !== 'undefined') {

					for (var i = 0; i < arts.length; i++) {
						var matched = false;
						for (var j = 0; j < user.art.length; j++) {
							if (arts[i].id == user.art[j].id) {
								matched = true;
							}

							if (j == (user.art.length - 1) && matched == false) {
								notMatch.push(arts[i].id);
							}
						}
					}

				}
					
				if (notMatch.length > 0) {
					for (var i = 0; i < notMatch.length; i++) {
						//console.log("notMatch.length is greater than 0");
						var x = notMatch[i];
						noMatchObj.push(arts[x - 1]);
					}
				} else if (user.art.length == 0 && notMatch.length == 0) {
					//console.log("Artist has no art");
					noMatchObj = arts;
				} else {
					//console.log("Artist does have art, and there are no mismatches (user has ALL the art)");
				}

				return response.view('selectArtForArtist', {
					art: noMatchObj,
					artist: user
				});
			});
		});
	},

	connectArt: function(request, response) {
		var artistId = request.param('id');
		var ids = request.param('arr');

		console.log("Artist ID: " + artistId);
		console.log("IDs array: " + ids);
		console.log("IDs array length: " + ids.length);

		Artists.findOne(artistId).populate('art').exec(function(err, user) {
			if (err) { return response.serverError(err); }
			
			user.art.add(ids);
			user.save(function(err) {
				if (err) { return response.serverError(err); }
      			return response.ok();
			});
		});

		for (i = 0; i < ids.length; i++) {
			var idNum = ids[i];
			console.log("Art ID: " + idNum);
			console.log("Artist ID: " + artistId);
			
			Art.update({id: idNum}, {
				artist: artistId
			}).exec(function(err, artist) {
				if (err) { return response.serverError(err); }
				return response.ok();
			});
		}
	}
};

