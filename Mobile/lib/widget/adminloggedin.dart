import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_example/main.dart';
import 'package:google_signin_example/page/home_page.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'background_painter.dart';

class AdminLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(
          fit: StackFit.expand,
          children: [
            buildO(context),

            //CustomPaint(painter: BackgroundPainter()),
            //Positioned(top: 33, right: 10, child: buildLO(context)),

            //buildBox(context)
          ],
        )),
      );
  Widget buildO(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
            "Welcome Admin",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          buildLO(context),
          /*Text(
            '   ' + user.email,
            style: TextStyle(color: Colors.white),
          ),*/
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
      //alignment: Alignment.topRight,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyApp()));

          /*final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.logout();*/
        },
        child: const Text('Logout', style: TextStyle(fontSize: 15)),
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 7,
      ),
    );
  }
}
