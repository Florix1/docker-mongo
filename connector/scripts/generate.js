function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function randomString(size) {
  var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmntestqrstuvwxyz";
	var string_length = size;
	var result = '';
	for (var i=0; i<string_length; i++) {
		var rnum = Math.floor(Math.random() * chars.length);
		result += chars.substring(rnum,rnum+1);
	}
	return result;
}

function getRandomDate() {
    // aprox nr of days since 1970 untill 2000: 30years * 365 days
    var nr_days1 = 30*365;
    // aprox nr of days since 1950 untill 1970: 20years * 365 days
    var nr_days2 = -20*365;

    // milliseconds in test day
    var test_day=1000*60*60*24

    // get a random number of days passed between 1950 and 2000
    var days = getRandomInt(nr_days2, nr_days1);

    return new Date(days*test_day)
}

var max = 100;

for (var i = 1; i <= max; i++) {    
  db.test.insert( 
    { 
      index : i, 
      user : randomString(10),
      password : randomString(12),
      hiredate: getRandomDate()
    } 
  ) 
}
