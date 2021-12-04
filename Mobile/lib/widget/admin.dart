import 'dart:convert';
import 'package:google_signin_example/widget/adminloggedin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

final Color yellow = Color(0xfffbc31b);
final Color orange = Color(0xfffb6900);

class Admin extends StatefulWidget {
  @override
  _Admin1State createState() => _Admin1State();
}

class _Admin1State extends State<Admin> {
  var decoded1;
  int length1;
  bool showing = true;
  String emailvalue = "";
  String detect = "";
  /*void show() async {
    // ignore: await_only_futures
    print(emailvalue);
    if (emailvalue == "") {
      emailvalue = "999";
      detect = "Fetching All Users data";
    }
    final response = await await await http
        .get(Uri.parse('https://readability-apis.herokuapp.com'));
    print(response.body);
    decoded1 = json.decode(response.body) as Map<String, dynamic>;
    print(
        "decoded1-----------------------------------------------------------------------");
    print(decoded1);
    print(decoded1["output"]["0"]);
    length1 = decoded1["output"].length;
    print(length1);
    if (length1 == 0) {
      setState(() {
        detect = "There is no such user in database";
      });
    }
    print(emailvalue);
    if (length1 != 0) {
      setState(() {
        // showing=false;
        Navigator.push(context, MaterialPageRoute(builder: (context) => null));
        print("navigation");
      });
    }
  }*/

  final titleController = TextEditingController();
  String text = "";
  String pass1 = "";

  final titleController1 = TextEditingController(text: "trrtrt");
  void _setText() {
    setState(() {
      text = titleController.text;
      if (text == "root" && pass1 == "root") {
        text = "Successfully logging in";
        print(text);
      } else {
        text = "Either Admin name or Passsword is Wrong";
        print(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('ADMIN LOGIN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Admin Name',
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                hintStyle: TextStyle(
                  color: Colors.white38,
                ),
                hintText: 'Enter Your Admin Name',
              ),
              autofocus: false,
              controller: titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white38,
                ),
                hintStyle: TextStyle(
                  color: Colors.white38,
                ),
                labelText: 'Password',
                hintText: 'Enter Your Password',
              ),
              autofocus: false,
              obscureText: true,
              onChanged: (value) => pass1 = value,
              //controller: titleController,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          RaisedButton(
            onPressed: () {
              _setText;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminLoggedIn()));
            },
            child: Text('Submit', style: TextStyle(fontSize: 20)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 8,
            splashColor: Colors.redAccent,
            color: Colors.orangeAccent,
            hoverColor: Colors.green,
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            height: 20,
          ),
          Text(text),
        ],
      ),
    );
  }
}
