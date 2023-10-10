const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  const queryData = req.query;
  const formattedData = objfunc(queryData);
  res.send(formattedData);
});

app.post('/', (req, res) => {
  const bodyData = req.body;
  const formattedData = objfunc(bodyData);
  res.send(formattedData);
});

app.put('/', (req, res) => {
  const bodyData = req.body;
  const formattedData = objfunc(bodyData);
  res.send(formattedData);
});

app.delete('/', (req, res) => {
  const bodyData = req.body;
  const formattedData = objfunc(bodyData);
  res.send(formattedData);
});

function objfunc(obj) {
  const formattedData = Object.keys(obj)
    .map(key => `${key} : ${obj[key]}`)
    .join('\n');
  return formattedData;
}

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});