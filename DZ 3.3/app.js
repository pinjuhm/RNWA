const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require("cors");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(cors());

app.get('/', function (req, res) {
return res.send({ error: true, message: 'hello' })
});

const dbConn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'world-database'
});

dbConn.connect(err => err && console.log(err)); 

app.get('/world-databases', function (req, res) {
    dbConn.query('SELECT * FROM baze_podataka', function (error, results, fields) {
        if (error) throw error;
        return res.send({
            error: false, 
            data: results, 
            message: 'World database list' 
        });
    });
});


app.get('/world-database/:id', function (req, res) {
    let id = req.params.id;
    if (!id) {
        return res.status(400).send({ error: true, message: 'Please provide id' });
    }

    dbConn.query('SELECT * FROM baze_podataka where id=?', id, function (error, results, fields) {
	if (error) throw error;
	return res.send({ 
        error: false, 
        data: results.length > 0 ? results[0] : null, 
        message: `Single world database for id = ${id}` 
    });
	});
});

app.post('/world-database', function (req, res) {
	let database = req.body.database;
    const {naziv, opis} = database;

	if (!database) {
	    return res.status(400).send({ error:true, message: 'Please provide database' });
	}

	dbConn.query("INSERT INTO baze_podataka VALUES(NULL, ?, ?, ?, ?, ?)", [
        naziv, 
        opis, 
    ], function (error, results, fields) {
	    if (error) throw error;
	    return res.send({ 
            error: false, 
            data: results, 
            message: 'New database has been created successfully.' 
        });
	});
});

app.put('/world-database', function (req, res) {
	let database = req.body.employee;
    const {id, naziv, opis} = database;

	if (!id || !database) {
		return res.status(400).send({ 
            error: true,
            employee, 
            message: 'Please provide value for database and id' 
        });
	}

	dbConn.query("UPDATE baze_podataka SET naziv = ?, opis = ? where id = ?", [
        naziv, 
        opis,
        id
    ], function (error, results, fields) {
	    if (error) throw error;
	    return res.send({ error: false, data: results, message: 'Database has been updated successfully.' });
	});
});

app.delete('/world-database/:id', function (req, res) {
	let id = req.params.id;
	if (!id) {
	    return res.status(400).send({ 
            error: true, 
            message: 'Please provide value for id' 
        });
	}

	dbConn.query('DELETE FROM baze_podataka where id = ?', [id], function (error, results, fields) {
	    if (error) throw error;
	    return res.send({ 
            error: false, 
            data: results, 
            message: 'Database has been deleted successfully.' 
        });
	});
}); 

app.listen(3000, function() {
	console.log('Node app is running on port 3000');
});
module.exports = app;