const http = require('http');
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const mongoose = require('mongoose')
require('mongoose-type-url');
const User = require('./models/user.js')
var {PythonShell} = require("python-shell"); 
const accountSid = 'ACadddd9627c452e644c45d12f4ce57b33';
const authToken = '6dbb0e06ae243bc0f7026819af885730';
const client = require('twilio')(accountSid, authToken);
const MessagingResponse = require('twilio').twiml.MessagingResponse;


const detect = require("./recognition.js")
// const faceapi = require("./face-api.min.js")

// faceapi.nets.ssdMobilenetv1.loadFromUri('C:\\Users\\Lenovo\\Desktop\\ML\\check\\face-api\\face-attendance\\weights'),
// faceapi.nets.faceLandmark68Net.loadFromUri('./weights')



const app = express();

app.use(bodyParser.urlencoded({ extended: false }));

//CONNECT TO DB
mongoose.connect("mongodb+srv://carol:carol@cluster0-a5qaf.mongodb.net/test?retryWrites=true&w=majority", { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
  console.log("connected to db");
})

app.use(session({secret: 'anything-you-want-but-keep-secret'}));


//global variable//

var opt = 999                                     
var reg = 999
var registration = 999
var d = new Date();
var day = d.getDay();


app.get('/', async(req, res, next) => {
  res.json({ ok : "ok" });
})



app.post('/sms', async (req, res) => {
  const twiml = new MessagingResponse();
  // const smsCount = req.session.counter || 0;
  // let message = 'Hello, thanks for the new message.';
  // if(smsCount > 0) {
  //   message = 'Hello, thanks for message number ' + (smsCount + 1);
  // }
  // req.session.counter = smsCount + 1;
  // const twiml = new MessagingResponse();
  // twiml.message(message);

  
  // const message = twiml.message();
  // message.body('The Robots are coming! Head for the hills!');
  // message.media('https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg');


  let counter = req.session.counter || 0
  var message = 'Hello, thanks for the new message.';
  const text = req.body.Body
  const xxx = req.body.From
    
   var x = await User.find().distinct('phone')

   var registration = 1;
   if(x.includes(xxx)){
    registration = 0;
    }


  function add_user(text) {
    let obj = (text.split('\n'))
    let obj1 = []
    for(var i=0;i<3;i++){
      obj1.push(obj[i].split(':')[1])
    }

    const user = new User({
      name : obj1[0],
      email : obj1[1],
      password : obj1[2],
      phone : req.body.From,
    });
    return user;
  }


  const { body } = req;

  async function notify(){
    if (body.NumMedia > "0") {
      let students=["+919969276653","+919604003680","+919320021013"];
      // let students=[];

      for (var i=0; i < students.length ;i++){
        client.messages
          .create({
            from: 'whatsapp:+14155238886',
            body: `Your Attendance for the Lecture M.P on 03-03-2020 has been marked *present*`,
            to: 'whatsapp:' + String(students[i])
          })
      }

      const message = twiml.message();
      const mediaUrl = body["MediaUrl0"];
      console.log(mediaUrl);
      // let adf = await detect(mediaUrl)
      message.body('Attendance notified to all the students in the picture!');
      message.media(mediaUrl);
    } else {
      message = `Please send an Image!!`
    }
   }

  if (registration == 1){  
      if (text == 'Hello' || text == 'Hi' || text == 'Hey' || text == 'Heyy') {
        message = `Welcome to the FR.CRCE Attendance app!!We notice that you are not registered with the app\n\nType REGISTER to continue`;
    } else if(text == 'REGISTER' || text == 'Register'){
        reg = counter+1;
        message = 'Pleae fill the form below:\n\nName :\nEmail:(optional)\nPassword:\n\nAnd send athe user image to build the profile(Optional)'
    } else if (reg == counter ){
        // code to add it to the database
        reg = 999
        let user = add_user(text)

        try{
            user.save()
            registration = 0;
            message = 'User sucessfully registered!!';
        } catch (err) {
        message = 'Failed to Sign up!! Please fill all the details in the form';
        }
      }
    } else if(registration == 0 ){

      // if the day is tuesday!! day == 2
          if (text == 'Hello' || text == 'Hi' || text == 'Hey' || text == 'Heyy' || text == 'OPTIONS' || text == "Options")  {
            
            message = 'Hello there!! Welcome to the FR.CRCE Attendance app...\n\nType:-\n\nATTENDANCE - To take attendance of the lecture\n\nEXCEL - To get the attendance of the class in an excel-sheet\n\nNOTIFY - Send parents/local-Guardian the semesterly attendance\n\nSHOW - To see the overall attendance of the class for the semester';
          } else if (text == 'ATTENDANCE' || text == 'Attendance') {
            //notification
            opt = counter+1
            message = 'Send the classphoto for the facial recognition:\n\nThis might take a while';
          } else if (text == 'NOTIFY' || text == 'Notify') {
            
            var vol = ["+918355889498","+918452937720"]

            for (var i=0; i < vol.length ;i++){
              var result = "https://docs.google.com/spreadsheets/d/1IWbsGzyaAxiQoIfbYXsZFsqH1g2RpBRZwRs76VGN76E/edit?usp=sharing";
              client.messages
                .create({
                  from: 'whatsapp:+14155238886',
                  body: `To check your ward's attendance please click on the link below\n\nLink: ${result}`,
                  to: 'whatsapp:' + String(vol[i])
                })
                .then(message => console.log(message.sid));
            }
            message = `Notified to all the parents`
          
          } else if (text == 'SHOW' || text == 'Show') {
            var result = "https://docs.google.com/spreadsheets/d/1IWbsGzyaAxiQoIfbYXsZFsqH1g2RpBRZwRs76VGN76E/edit?usp=sharing";
            message = `Attendance sheet of the semester: \n\nlink: ${result}`;
          } else if (text == 'Bye' || text == 'Tata') {
            
            message = 'Goodbye';
          } else if (text == 'Excel' || text == 'EXCEL') {
            var result = "https://docs.google.com/spreadsheets/d/1IWbsGzyaAxiQoIfbYXsZFsqH1g2RpBRZwRs76VGN76E/edit?usp=sharing";
            message = `Attendance sheet of the lecture: \n\nlink: ${result}`;
          } else if ( opt == counter) {

            notify()
            // code to add it to the database
            opt = 999

          } else {

            // var options = {
            //   mode: 'text',
            //   encoding: 'utf8',
            //   pythonOptions: ['-u'],
            //   scriptPath: './',
            //   args: [text,xxx],
            //   pythonPath: 'C:/Python/Python38/python.exe'
            // };
          
            // PythonShell.run('utils.py', options, function (err, mess) {
            //   if (err) throw err;
            //   // results is an array consisting of messages collected during execution
            //   console.log(mess);           
            // })


            console.log(message);

            message = "SORRY!! DID'NT GET YOU!!";
          }
      }

  req.session.counter = counter + 1;
  twiml.message(message);

  res.writeHead(200, {'Content-Type': 'text/xml'});
  res.end(twiml.toString());
});

http.createServer(app).listen(3000, () => {
  console.log('Express server listening on port 3000');
});
