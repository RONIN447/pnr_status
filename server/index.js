const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const app = express();
const cors = require('cors');
app.use(cors());

// const port = 3000;

// Set up body-parser
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Database connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root', // Your MySQL username
  password: 'Akshat@4420', // Your MySQL password
  database: 'reservation_system',
  port: '3306'
});

db.connect((err) => {
  if (err) throw err;
  console.log('Connected to MySQL database.');
});

// Route to fetch ticket details by PNR
app.get('/ticket/:pnr', (req, res) => {
    const pnr = req.params.pnr;
    console.log('Received PNR:', pnr);
    const query = 'SELECT * FROM tickets WHERE pnr = ?';
    db.query(query, [pnr], (err, result) => {
      if (err) {
        console.error('Query Error:', err);
        res.status(500).send('Internal Server Error');
      } else {
        console.log('Query Result:', result);
        if (result.length > 0) {
          res.json(result[0]);
        } else {
          console.log('No ticket found for PNR:', pnr);
          res.status(404).send('Ticket not found!');
        }
      }
    });
  });
  

// Start the server
app.listen(3000, () => {
  console.log(`Server is running on port 3000`);
});
