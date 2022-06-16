const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const postgresql = require('postgresql');
const cors = require("cors");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(cors());

// Authorization data
const USER = 'admin';
const PASS = 'admin123';

app.use((req, res, next) => {
    let auth;
    if (req.headers.authorization) {
      auth = new Buffer.from(req.headers.authorization.substring(6), 'base64').toString().split(':');
    }

    const [user, pass] = auth;
    if (!auth || user !== USER || pass !== PASS) {
        res.statusCode = 401;
        res.setHeader('WWW-Authenticate', 'Basic realm="MyRealmName"');
        res.end('Unauthorized');
        return;
    } 
    next();
});


app.get('/', function (req, res) {
return res.send({ error: true, message: 'hello' })
});

const dbConn = postgresql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'hospital'
});

dbConn.connect(err => err && console.log(err)); 

app.get('/hospital', function (req, res) {
    dbConn.query('SELECT * FROM hospital', function (error, results, fields) {
        if (error) throw error;
        return res.send({
            error: false, 
            data: results, 
            message: 'Employees' 
        });
    });
});


app.get('/hospital/:id', function (req, res) {
    let id = req.params.id;
    if (!id) {
        return res.status(400).send({ error: true, message: 'Please provide id' });
    }

    dbConn.query('SELECT * FROM hospital where id=?', id, function (error, results, fields) {
	if (error) throw error;
	return res.send({ 
        error: false, 
        data: results.length > 0 ? results[0] : null, 
        message: `Employee id = ${id}` 
    });
	});
});

app.post('/hospital', function (req, res) {
	let employee = req.body.employee;
    const {ime, prezime, datumR, adresa, spol, kontakt, datumZ} = employee;

	if (!employee) {
	    return res.status(400).send({ error:true, message: 'Please provide employee' });
	}

	dbConn.query("INSERT INTO hospital VALUES(NULL, ?, ?, ?, ?, ?)", [
        ime, 
        prezime,
		datumR,
		adresa,
		spol,
		kontakt,
		datumZ
    ], function (error, results, fields) {
	    if (error) throw error;
	    return res.send({ 
            error: false, 
            data: results, 
            message: 'New employee has been created successfully.' 
        });
	});
});

app.put('/hospital', function (req, res) {
	let employee = req.body.employee;
    const {id, ime, prezime, datumR, adresa, spol, kontakt, datumZ} = employee;

	if (!id || !employee) {
		return res.status(400).send({ 
            error: true,
            employee, 
            message: 'Please provide value for employee and id' 
        });
	}

	dbConn.query("UPDATE hospital SET ime=?, prezime=?, datumR=?, adresa=?, spol=?, kontakt=?, datumZ=?", [
        ime,
		prezime,
		datumR,
		adresa,
		spol,
		kontakt,
		datumZ
    ], function (error, results, fields) {
	    if (error) throw error;
	    return res.send({ error: false, data: results, message: 'Database has been updated successfully.' });
	});
});

app.delete('/hospital/:id', function (req, res) {
	let id = req.params.id;
	if (!id) {
	    return res.status(400).send({ 
            error: true, 
            message: 'Please provide value for id' 
        });
	}

	dbConn.query('DELETE FROM hospital where id = ?', [id], function (error, results, fields) {
	    if (error) throw error;
	    return res.send({ 
            error: false, 
            data: results, 
            message: 'Employe has been deleted successfully.' 
        });
	});
}); 

app.listen(3000, function() {
	console.log('Node app is running on port 3000');
});
module.exports = app;