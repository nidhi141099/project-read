import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NewObject {
  final String title;
  NewObject(this.title);
}

class Improve extends StatelessWidget {
  String thistext;
  Improve(String this.thistext);

  static final List<NewObject> items = <NewObject>[
    NewObject('Apple'),
    NewObject('Banana'),
    NewObject('Orange'),
    NewObject('Other Fruit'),
  ];
  NewObject value = items.first;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(
          fit: StackFit.expand,
          children: [
            buildO(context),
            //CustomPaint(painter: BackgroundPainter()),
            Positioned(top: 33, right: 10, child: buildLO(context)),
            buildBox(context)
          ],
        )),
      );
  Widget buildO(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          color: Colors.blueGrey.shade900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user.photoURL),
          ),*/
              SizedBox(height: 30),
              SizedBox(width: 20),
              //buildLO(context),
              Text(
                '  ' + user.displayName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '   ' + user.email,
                style: TextStyle(color: Colors.white),
              ),
              //SizedBox(height: 100),
              /*ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          ),*/
              //buildLO(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLO(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: RaisedButton(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.logout();
        },
        child: const Text('Logout', style: TextStyle(fontSize: 15)),
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 7,
      ),
    );
  }

  String textdata;

  Widget buildBox(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Container(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          SizedBox(height: 125),
          // Image.network(widget.user.photoUrl,height: 100,width: 400,),
          Text(
            "READABILITY ANALYSER",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white38),
          ),
          Card(
            color: Colors.white70,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                thistext,
                //minLines: 8,
                //maxLines: 8,
                //decoration: InputDecoration.collapsed(hintText: thistext),
                //onChanged: (value) => textdata = value,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<NewObject>(
              value: value, // currently selected item
              items: items
                  .map((item) => DropdownMenuItem<NewObject>(
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              item.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        value: item,
                      ))
                  .toList(),
              onChanged: (value) => setState(() {
                this.value = value;
              }),
            ),
          )
        ]));
  }

  setState(Null Function() param0) {}
}
