const express = require('express');
const { exec } = require('child_process');

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
});

app.get('/', (req, res) => {
    console.log("rcvd req ==> ", );
    exec('curl -s --unix-socket /run/docker.sock http://docker/containers/$HOSTNAME/json', (err, stdout, stderr) => {
        // res.send({ info11: stdout, info12: typeof(stdout), time23: new Date().toISOString() })
        res.send({ info11: JSON.parse(stdout)["Name"], time23: new Date().toISOString() })
    })
})