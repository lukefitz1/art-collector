/**
 * LoginController
 *
 * @description :: Server-side logic for managing logins
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
	_config: {
		actions: false
	},
	index: function(request, response) {
		return response.view('login', {
			// currentDate: (new Date()).toString()
		});
	}
};

