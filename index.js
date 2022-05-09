const express = require('express');
var fs = require('fs');
const app = express();
const PORT = process.argv[2] || 3000;

app.listen(PORT, (error) =>{
    if(!error)
        console.log("Server listening on port "+ PORT)
    else 
        console.log("Error occurred, server can't start", error);
    }
);

app.get('/pdf1', (req, res) => {    
    console.log('request on ',PORT);
    // res.sendFile(__dirname+'/resources/pdf1.pdf');               // use either of these to res.sendFile
    res.sendFile('/resources/pdf1.pdf', {root: __dirname});
});

app.get('/pdf2', (req, res) => {    
    // res.sendFile(__dirname+'/resources/pdf1.pdf');               // use either of these to res.sendFile
    // res.sendFile('/resources/pdf2.pdf', {root: __dirname});
    res.status(200).send('pdf2 size is big... laterrrr');
});

app.get('/loadTest1', (req, res) => {
    fs.appendFileSync('./resources/loadTest1.txt', 'jingchak\n');
    res.send('data appended');
})