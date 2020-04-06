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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
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
      ),
    );
  }
}
