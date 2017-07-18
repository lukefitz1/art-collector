/**
 * Art.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

	attributes: {
		obj_id: {
			type: 'string',
			size: 128,
			required: true
		},
		type: {
			type: 'string',
			size: 128,
			required: true
		},
		title: {
			type: 'string',
			size: 128,
			required: true
		},
		date: {
			type: 'string',
			size: 128,
		},
		medium: {
			type: 'string',
			size: 128,
		},
		image: {
			type: 'string',
			size: 128,
		},
		description: {
			type: 'text',
		},
		dimensions: {
			type: 'string',
			size: 128,
		},
		frame_dimensions: {
			type: 'string',
			size: 128,
		},
		condition: {
			type: 'string',
			size: 128,
		},
		current_location: {
			type: 'string',
			size: 128,
		},
		source: {
			type: 'string',
			size: 128,
		},
		date_acquired: {
			type: 'string',
			size: 128,
		},
		amount_paid: {
			type: 'string',
			size: 128,
		},
		current_value: {
			type: 'string',
			size: 128,
		},
		notes: {
			type: 'text'
		},
		owner: {
	      	model: 'customer'
	    },
	    artist: {
	    	model: 'artists'
	    }
	}
};

