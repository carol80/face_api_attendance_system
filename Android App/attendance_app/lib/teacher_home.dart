

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Teacher(),
)
);

class Teacher extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'Teacher\'s Home',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
              child: Column(
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
          ]
        ),
      )		
    );
  }
}






