import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Home(),
        '/secondPage': (context) => const SecondRoute()
      },
    );
  }
}


final TextEditingController username = TextEditingController();
final TextEditingController password = TextEditingController();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => Home_State();
}

class Home_State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("website"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: username,
                style: const TextStyle(color: Colors.deepPurple),
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "UserName",
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: password,
                style: const TextStyle(color: Colors.deepPurple),
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
              onPressed: functionLogIn,
              label: const Text("Log In"),
              icon: const Icon(CupertinoIcons.arrow_right))
        ],
      ),
      backgroundColor: Colors.grey[850],
    );
  }

  void functionLogIn() {
    if (username.text.trim() != "" && password.text.trim() != "") {
      Navigator.pushNamed(context, '/secondPage');
    } else {
      Fluttertoast.showToast(
          msg: "please fill in your credentials ",
          textColor: Colors.purple,
          backgroundColor: Colors.grey[500]);
    }
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Image.network('https://tse3.mm.bing.net/th?id=OIP.XnUXLtZZOX6NL66TeneKSAHaJ4&pid=Api&P=0&h=180'),
        ),
      backgroundColor: Colors.grey[850],
    );
  }
}
