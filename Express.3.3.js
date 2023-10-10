const express = require('express');
const app = express();
const port = 3000;

app.get('/factorial', (req, res) => {
    const number = req.query.number;
    if (!number) {
        return res.send('Invalid.');
    }
    res.redirect(`/factorial/${number}`);
});

app.get('/factorial/:number', (req, res) => {
    const number = parseInt(req.params.number);
    if (isNaN(number) || number < 0) {
        return res.send('Invalid number.');
    }

    const factorial = calculateFactorial(number);
    res.send(`Factorial of ${number} is ${factorial}`);
});

const calculateFactorial = (n) => {
    if (n < 0) {
        return 'Invalid input.';
    }
    let result = 1;
    for (let i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
};

app.listen(port, () => {
    console.log(`Server is listening on port ${port}`);
});