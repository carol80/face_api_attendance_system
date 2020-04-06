//Intro Page

import 'package:attendance_app/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:Home()
)
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'Attendance System',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.green[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'FR. CONCEICAO RODRIGUES COLLEGE OF ENGINEERING',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '(Approved by AICTE & Affiliated tp university of Mumbai)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Bandstand,Bandra (W), Mumbai - 400 050. *Tel.: 6711 4000 * Fax: 6711 4200 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ],
                  ),
              ],
            ),
          ),
          SizedBox(height: 15.0,),
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage('http://gyan.fragnel.edu.in:2222/moodle/data/agnel.jpg'),
              radius: 80.0,
            ),
          ),
          SizedBox(height: 15.0,),
          Divider(
            height:5.0,
            thickness:2.0,
            color:Colors.blueAccent,
            indent:30.0,
            endIndent:30.0, 
          ),
          SizedBox(height: 15.0,),
          Center(
            child: Text(
              'Attendance System Using',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              'Face Detection',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15.0,),
          Divider(
            height:5.0,
            thickness:2.0,
            color:Colors.blueAccent,
            indent:30.0,
            endIndent:30.0, 
          ),
          SizedBox(height: 50.0,),
          Center(
            child: ButtonTheme(
                minWidth: 150,
                height: 60,
                buttonColor: Colors.lightBlueAccent,
                child: RaisedButton(
                onPressed: (){
                  Route route = MaterialPageRoute(builder: (context) => Login());
                  Navigator.pushReplacement(context, route);
                }, 
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                    '*Only for teachers',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10.0,
                    ),
                  ),
            ),
          ),
          SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                    'Developed By: Carol Sebastian, Surya Partap and Kevin Ruffin (TE Comps)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ),
       ]
      ),
      
    );
  }
}