var requestClient = require('request');
/*
var num = Math.random() + "";
requestClient(
    { method: 'PUT'
    , url: 'http://api.reimaginebanking.com/accounts/577db8d6ebcfe1505405ba13?key=986e6cd9f1e5a0731f02a1c724f3273a'
    , headers: {'content-type': 'application/json'
	}
	, body: JSON.stringify({
		  nickname: num,
		  account_number: "0000000000000000"
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
	drone.after(5000, function() {
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
*/

var num = Math.random() + "";
requestClient(
    { method: 'PUT'
    , url: 'http://api.reimaginebanking.com/accounts/577db8d6ebcfe1505405ba13?key=986e6cd9f1e5a0731f02a1c724f3273a'
    , headers: {'content-type': 'application/json'
	}
	, body: JSON.stringify({
		  nickname:  Math.random() + "",
		  account_number: "1234567890123456"
		})
    }
  , function (error, response, body) {
      if(response.statusCode == 202){
        console.log('changed account name');
      } else {
        console.log('error adding account: '+ response.statusCode)
        //console.log(response.data)
      }
    }
  ); 
