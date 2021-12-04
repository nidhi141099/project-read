import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:google_signin_example/widget/impr.dart';
import 'package:google_signin_example/widget/improve.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          buildO(context),
          //CustomPaint(painter: BackgroundPainter()),
          Positioned(top: 33, right: 10, child: buildLO(context)),
          buildBox(context)
        ],
      );
  Widget buildO(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
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
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
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
              child: TextField(
                minLines: 8,
                maxLines: 8,
                decoration:
                    InputDecoration.collapsed(hintText: "Enter Your Text Here"),
                onChanged: (value) => textdata = value,
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 10,
                  splashColor: Colors.redAccent,
                  color: Colors.orangeAccent,
                  hoverColor: Colors.green,
                  child: Text("Readability", style: TextStyle(fontSize: 20)),
                ),
                /*RaisedButton(
                  onPressed: () => null,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 10,
                  splashColor: Colors.redAccent,
                  color: Colors.orangeAccent,
                  hoverColor: Colors.green,
                  child: Text("History", style: TextStyle(fontSize: 20)),
                ),*/
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Impr(textdata)),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 10,
                  splashColor: Colors.redAccent,
                  color: Colors.orangeAccent,
                  hoverColor: Colors.green,
                  child: Text("Improve", style: TextStyle(fontSize: 20)),
                )
              ]),
          /*Column(children: <Widget>[
            RaisedButton(
              onPressed: () => this.show1(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 10,
              splashColor: Colors.redAccent,
              color: Colors.orangeAccent,
              hoverColor: Colors.green,
              child: Text("History",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ]),
          Column(children: <Widget>[
            RaisedButton(
              onPressed: () => print("Improve"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 10,
              splashColor: Colors.redAccent,
              color: Colors.orangeAccent,
              hoverColor: Colors.green,
              child: Text("Improve",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ]),*/
        ]));
  }
}
