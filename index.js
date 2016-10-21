var QRAR = require('qrar');
var arDrone = require('ar-drone');
var drone  = arDrone.createClient({
	ip: '192.168.43.106'
});
var requestClient = require('request');
var codes = new QRAR(drone);
var events = require('events');
var droneRequestEmitter = new events.EventEmitter();
var droneRequested = false;
var accBalance = -1;
var uriprefix = "http://api.reimaginebanking.com/";
var urisuffix = "?key=986e6cd9f1e5a0731f02a1c724f3273a";
//var urifull = uriprefix + urimiddle + urisuffix;
var pollDrone = function () {
	console.log("polling");
	if (!droneRequested) {
		//GET request
		//drone.animateLeds("blinkGreen", 5, 1);
		var uri = uriprefix + "accounts" + urisuffix;
		console.log("GET request to " + uri);
		requestClient(uri, function (error, res, body) {
			console.log("Returning");
			if(!error && res.statusCode == 200) {
				var newBalance = JSON.parse(body).length;
				console.log(newBalance);
				if (accBalance == -1) {
					//set if it has not been initialized yet
					accBalance = newBalance;
					console.log('Initializing balance');
				} else {
					if (accBalance != newBalance) {
						//send a drone if there was a change
						console.log('emitting event sendDrone');					
						droneRequestEmitter.emit("sendDrone");
						accBalance = newBalance;
						droneRequested = true;
						clearInterval(pollDroneRequest);
					}
				}
			
			} else { 
			//error
				console.error(error);
			}
		});
	}
};
var pollDroneRequest = setInterval(pollDrone, 1000); 
codes.start();
droneRequestEmitter.on("sendDrone", function () {
	console.log("waiting for code");
	drone.takeoff();
	/*drone
  .after(5000, function() {
    this.up(0.1);
  }).after(1000, function() {
	this.stop();
});*/
codes.once('qrcode', function (code) {
	console.log(code);
	var accountNumber = code.split("-")[0];
	var amountToWithdraw = Number(code.split("-")[1]);
	console.log(amountToWithdraw);
	var urifull = uriprefix + "accounts/577db8d6ebcfe1505405ba13/withdrawals" + urisuffix;
	console.log(urifull);
	var num = Math.random() + "";
requestClient(
    { method: 'PUT'
    , url: 'http://api.reimaginebanking.com/accounts/577db8d6ebcfe1505405ba13?key=986e6cd9f1e5a0731f02a1c724f3273a'
    , headers: {'content-type': 'application/json'
	}
	, body: JSON.stringify({
		  nickname: num,
		  account_number: "1234567890123456"
		})
    }
  , function (error, response, body) {
      if(response.statusCode == 202){
        console.log('changed account name');
	requestClient(
    { method: 'POST'
    , url: urifull
    , headers: {'content-type': 'application/json'
	}
	, body: JSON.stringify({
		  medium: "balance",
		  transaction_date: "2016-07-07",
		  status: "pending",
		  amount: amountToWithdraw,
		  description: "string"
		})
    }
  , function (error, response, body) {
      if(response.statusCode == 201){
        console.log('withdrawal completed');
	drone.animateLeds("blinkGreen", 5, 2);
	drone.after(2000, function() {
	    this.stop();
	    this.land();
	  });
	droneRequested = false;
	pollDroneRequest = setInterval(pollDrone, 1000);
      } else {
        console.log('error: '+ response.statusCode)
        //console.log(response.data)
      }
    }
  );
      } else {
        console.log('error adding account: '+ response.statusCode)
        //console.log(response.data)
      }
    }
  );


});

});


//console.log("done");
