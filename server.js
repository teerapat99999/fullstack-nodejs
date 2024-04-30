const express = require('express');
const session = require('express-session'); 
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

app.use(session({
    secret: 'your_secret_key',
    resave: false,
    saveUninitialized: true 
}));




app.get('/post', (req, res) => {
    connection.query("SELECT * FROM type_post", (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาด' });
        } else {
            res.json(results);
        }
    });
});


app.post('/add', (req, res) => {
    const { post, details, type, id_user } = req.body;
    connection.query(
        "INSERT INTO post (post, details, type, id_user) VALUES (?, ?, ?, ?)",
        [post, details, type, id_user],
        (err, result) => {
            if(err) {
                console.error(err);
                return res.status(500).json({ error: 'เกิดข้อผิดพลาดในการเพิ่มโพสต์' });
            }
            console.log(result);
            res.status(200).json({ message: 'โพสต์สำเร็จ' });
        }
    );
});

app.get('/type', (req, res) => {
    connection.query("SELECT * FROM type_post", (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'ไม่มีประเภท' });
        } else {
            res.json(results);
        }
    });
});


app.get('/user', (req, res) => {
    connection.query("SELECT * FROM users", (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'ไม่มีผู้ใช้' });
        } else {
            res.json(results);
        }
    });
});



app.post('/reg', (req, res) => {
    const { fname_user, lname_user, username_user, password_user, img } = req.body;
    const type_user = 1;

    if (!fname_user || !lname_user || !username_user || !password_user || !img) {
        return res.status(400).json({ error: 'โปรดกรอกขอข้อมูลให้ครบ' });
    }

    connection.query("INSERT INTO users (fname_user, lname_user, username_user, password_user, type_user, img) VALUES (?, ?, ?, ?, ?, ?)",
        [fname_user, lname_user, username_user, password_user, type_user, img],
        (err, results) => {
            if (err) {
                console.error(err);
                res.status(500).json({ error: 'เกิดข้อผิดพลาด' });
            } else {
                res.status(200).json({ message: 'success' });
            }
        });
});

app.post('/login', (req, res) => {
    const { username_user, password_user } = req.body;
    connection.query("SELECT * FROM users WHERE username_user = ? AND password_user = ?", [username_user, password_user], (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: 'Failed to authenticate user' });
        }
        if (results.length === 0) {
            return res.status(401).json({ error: 'Invalid username or password' });
        } else {
            req.session.userid = results[0].id_user;
            res.status(200).json({ message: 'Login successful', userId: results[0].id_user });
        }
    });
});

app.post('/logout', (req, res) => {
    req.session.destroy(err => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Failed to logout' });
        } else {
            res.status(200).json({ message: 'Logout successful' });
        }
    });
});




const PORT = 5000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
