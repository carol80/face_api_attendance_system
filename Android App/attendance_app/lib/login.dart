import 'package:attendance_app/main.dart';
import 'package:attendance_app/teacher_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Login(),
)
);

class Login extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Login> {

  TextEditingController txt1 = new TextEditingController();
  TextEditingController txt2 = new TextEditingController();
  String id,password;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            'Login',
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
              child: Column(
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
            ),
          SizedBox(height: 15.0,),
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage('http://gyan.fragnel.edu.in:2222/moodle/data/agnel.jpg'),
              radius: 80.0,
            ),
          ),
          SizedBox(height: 15.0,),
            Container(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: txt1,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: 'Enter your Id:',
                      labelStyle: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 25.0,
                      )
                    ),
                    onFieldSubmitted: (String value1){
                      setState(() {
                        id=value1; //user input saved in variable id
                      });
                      print(id);
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    controller: txt2,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                      labelText: 'Enter your Password:',
                      labelStyle: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 25.0,
                      )
                    ),
                    onFieldSubmitted: (String value2){
                      setState(() {
                        password=value2; //user input saved in variable password
                      });
                      print(password);
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  SizedBox(height: 30.0,),
                  Center(
                  child: ButtonTheme(
                  minWidth: 100,
                  height: 50,
                  buttonColor: Colors.grey,
                  child: RaisedButton(
                  onPressed: (){
                    Route route = MaterialPageRoute(builder: (context) => Teacher());
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
            SizedBox(height: 25.0,),
            Center(
                  child: ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  buttonColor: Colors.blue,
                  child: RaisedButton(
                  onPressed: (){
                    Route route = MaterialPageRoute(builder: (context) => Home());
                    Navigator.pushReplacement(context, route);
                  }, 
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
                ],
              ),         
            ),
          ]
      ),
        ),
      ),
    );
  }
}
