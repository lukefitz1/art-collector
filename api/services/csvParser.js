/*
* @Author: Luke
* @Date:   2017-06-23 21:23:12
* @Last Modified by:   Luke
* @Last Modified time: 2017-06-24 09:59:19
*/

module.exports = {
	parseCsv: function(csvFile) {
		console.log("Parse CSV function!: " + csvFile)
	
		const csvFilePath = csvFile
		const csv = require('csvtojson');
		var importObj = [];

		csv()
		.fromFile(csvFilePath)
		.on('json',(jsonObj)=>{
			// combine csv header row and csv line to a json object
			// jsonObj.a ==> 1 or 4
			//console.log(jsonObj);
			//Art.artImport(jsonObj);
			importObj.push(jsonObj);
		})
		.on('done',(error)=>{
			//console.log(importObj);
			if(error) {
				console.log("Error");
				return error;
			}
			console.log('end');
			return importObj;
		})

		//return importObj;
	},

	promisePractice: function(testString) {

		return Q.Promise(function(resolve, reject) {
            if (testString) {
            	console.log(testString);
            	resolve(testString)
            } else {
            	console.log("No string");
            	var noString = "No string";
            	reject(noString);
            }
        });
        
	}
}