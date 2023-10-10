const fs = require('fs');
const path = require('path');

function findJSFiles(directory) {
  try {
    const files = fs.readdirSync(directory);
    for (const file of files) {
      const filePath = path.join(directory, file);
      const fileStat = fs.statSync(filePath);

      if (fileStat.isDirectory()) {
        findJSFiles(filePath);
      } else if (path.extname(file) === '.js') {
        console.log(filePath);
      }
    }
  } catch (error) {
    console.error(`Error: ${error}`);
  }
}


findJSFiles('test');