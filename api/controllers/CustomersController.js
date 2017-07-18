/**
 * CustomersController
 *
 * @description :: Server-side logic for managing customers
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	index: function(request, response) {
		Customer.find({})
			.then(function (customers) {
				return response.view('customers', {
					cust: customers
				});
			})
			.catch(function (err) {
				console.log(err);
				response.status(500)
					.json({error: err});
			});
	},

	getCustomers: function(request, response) {
		Customer.find({})
			.then(function (customers) {
				return response.view('customers', {
					cust: customers
				});
			})
			.catch(function (err) {
				console.log(err);
				response.status(500)
					.json({error: err});
			});
	},

	getCustomer: function(request, response) {
		Customer.findOne(request.param('id')).populate('art').exec(function foundUser(err, user) {
			return response.view('customer', {
				cust: user
			});
		});
			
	},

	newCustomer: function(request, response) {
		return response.view('addCustomer', {});
	},

	addCustomer: function(request, response) {
		var fn = request.param("fname");
		var ln = request.param("lname");
		var collect = request.param("collection");

		Customer.create({firstName: fn, lastName: ln, collectionName: collect}).exec(function (err, cust) {
			if (err) { return response.serverError(err); }
			return response.ok();
		})
	},

	editCustomer: function(request, response) {
		Customer.findOne(request.param('id')).exec(function foundUser(err, customer) {
			return response.view('editCustomer', {
				cust: customer
			});
		});
	},

	updateCustomer: function(request, response) {
		var id = request.param("id");
		var fn = request.param("fname");
		var ln = request.param("lname");
		var collect = request.param("collection");

		Customer.update({id: id}, {firstName: fn, lastName: ln, collectionName: collect}).exec(function(err, cust) {
			if (err) { return response.serverError(err); }
			return response.ok();
		});
	},

	deleteCustomer: function(request, response) {
		Customer.destroy(request.param('id')).exec(function(err, art) {
			if (err) { return response.serverError(err); }
		});

		response.redirect("/customers/getCustomers");
	},

	selectArt: function(request, response) {
		Customer.findOne(request.param('id')).populate('art').exec(function foundUser(err, user) {

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
						console.log("notMatch.length is greater than 0");
						var x = notMatch[i];
						noMatchObj.push(arts[x - 1]);
					}
				} else if (user.art.length == 0 && notMatch.length == 0) {
					console.log("User has no art");
					noMatchObj = arts;
				} else {
					console.log("User does have art, and there are no mismatches (user has ALL the art)");
				}

				return response.view('selectArt', {
					art: noMatchObj,
					cust: user
				});
			});
		});
	},

	connectArt: function(request, response) {
		var custId = request.param('id');
		var ids = request.param('arr');

		console.log("Customer ID: " + custId);
		console.log("IDs array: " + ids);

		Customer.findOne(custId).populate('art').exec(function(err, user) {
			if (err) { return response.serverError(err); }
			
			user.art.add(ids);
			user.save(function(err) {
				if (err) { return response.serverError(err); }
      			return response.ok();
			});
		});
	}

};

