var express = require('express')
var app = express();

var port = process.env.PORT || 5000;

process.env.PWD = process.cwd();

app.use(express.static(process.env.PWD + '/dist'));

app.get('*', function (req, res) {
  res.render(process.env.PWD + '/dist/index.html');
})

app.listen(port, function() {
  console.log("running app on " + port + " port");
})
