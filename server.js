const express = require('express');
const cors = require('cors');
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'nodetest'
});

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/users', (req, res) => {
    connection.query("SELECT * FROM users", (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Failed to retrieve users' });
        } else {
            res.json(results);
        }
    });
});

app.get('/users/:id', (req, res) => {
    const id = req.params.id;
    connection.query("SELECT * FROM users WHERE id = ?", [id], (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Failed to retrieve user' });
        } else {
            res.json(results);
        }
    });
});

app.post('/reg', (req, res) => {
    const { fname_user, lname_user, username_user, password_user, img } = req.body;
    const type_user = 1;

    connection.query("INSERT INTO users (fname_user, lname_user, username_user, password_user, type_user, img) VALUES (?, ?, ?, ?, ?, ?)", 
    [fname_user, lname_user, username_user, password_user, type_user, img], 
    (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Failed to insert user' });
        } else {
            res.status(200).json({ message: 'User inserted successfully' });
        }
    });
});




const PORT = 5000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});