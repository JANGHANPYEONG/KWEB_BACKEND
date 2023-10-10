const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));
app.set('view engine', 'pug');

app.get('/', (req, res) => {
    res.render('form'); 
});

app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    if (username === 'user' && password === 'password') {
        res.send(`Welcome, ${username}!`);
    } else {
        res.send('Invalid username or password. Please try again.');
    }
});

app.listen(port, () => {
    console.log(`Server is listening on port ${port}`);
});