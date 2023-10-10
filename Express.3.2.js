const express = require('express');
const app = express();
const port = 3000;

// GET /board/page/:page 라우트 정의
app.get('/board/page/:page', (req, res) => {
  const page = req.params.page; // 동적으로 받은 페이지 번호
  const responseText = `This is page ${page} of the board.`;
  res.send(responseText);
});

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});