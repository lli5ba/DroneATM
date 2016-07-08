var QRAR = require('qrar');
var arDrone = require('ar-drone');
var requestClient = require('request');

var client  = arDrone.createClient({
	ip: '192.168.43.106'
});
var codes = new QRAR(client);

var uriprefix = "http://api.reimaginebanking.com/accounts/";
//var urimiddle = "accounts/577db8d6ebcfe1505405ba13/withdrawals";
var urisuffix = "/withdrawls?key=986e6cd9f1e5a0731f02a1c724f3273a";
//var urifull = uriprefix + urimiddle + urisuffix;
codes.once('qrcode', function (code) {
	console.log(code);
	var accountNumber = code.split("-")[0];
	var amountToWithdraw = Number(code.split("-")[1]);
	console.log(amountToWithdraw);
	var urifull = uriprefix + accountNumber + urisuffix;
	console.log(urifull);
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
	client.animateLeds("blinkGreen", 5, 2);
      } else {
        console.log('error: '+ response.statusCode)
        //console.log(response.data)
      }
    }
  )
	/*
	//GET request
	requestClient(uri, function (error, res, body) {
		if(!error && res.statusCode == 200) {
			console.log(body);
		}
	});*/
});


codes.start();
//console.log("done");
