/**
 * AuthController
 *
 * @description :: Server-side logic for managing auths
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var passport = require('passport');

module.exports = {
	_config: {
        actions: false,
        shortcuts: false,
        rest: false
    },

    login: function(req, res) {

        passport.authenticate('local', function(err, admin, info) {
            if ((err) || (!admin)) {

                return res.send({
                    //message: info.message,
                    admin: admin
                });
            }
            req.logIn(admin, function(err) {
                if (err) res.send(err);
                
                return res.send({
                    message: info,
                    admin: admin
                });
            
            });

        })(req, res);
    },

    logout: function(req, res) {
        req.logout();
        res.redirect('/');
    }
};

