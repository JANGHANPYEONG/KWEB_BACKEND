const express = require('express');
const { runQuery } = require('./database');

const app = express();
const port = 3000;

app.listen(port, () => console.log(`Server listening on port ${port}!`));

app.get('/fare', async (req, res) => {
    const { uid } = req.query;

    try {
        const result = await runQuery(`
            SELECT ROUND(SUM(types.fare_rate * trains.distance / 1000), -2) AS total_fare
            FROM tickets
            JOIN trains ON tickets.train = trains.id
            JOIN types ON trains.type = types.id
            WHERE tickets.user = ?
        `, [uid]);

        if (result.length > 0) {
            res.send(`Total fare of ${uid} is ${result[0].total_fare} KRW.`);
        } else {
            res.status(404).send('Not found');
        }
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
});

// GET /train/status 라우트
app.get('/train/status', async (req, res) => {
    const { tid } = req.query;

    try {
        const trainInfo = await runQuery(`
            SELECT COUNT(tickets.id) AS booked_seats, types.max_seats
            FROM trains
            LEFT JOIN tickets ON tickets.train = trains.id
            JOIN types ON trains.type = types.id
            WHERE trains.id = ?
            GROUP BY trains.id
        `, [tid]);

        if (trainInfo.length > 0) {
            const { booked_seats, max_seats } = trainInfo[0];
            if (booked_seats >= max_seats) {
                res.send(`Train ${tid} is sold out.`);
            } else {
                res.send(`Train ${tid} is not sold out.`);
            }
        } else {
            res.status(404).send('Not found');
        }
    } catch (err) {
        console.error(err);
        res.status(500).send('Server Error');
    }
});
