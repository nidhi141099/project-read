import 'package:flutter/material.dart';
import 'package:google_signin_example/widget/background_painter.dart';
import 'package:google_signin_example/widget/google_signup_button_widget.dart';
import 'package:google_signin_example/widget/admin.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          buildBG(),
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(context),
        ],
      );

  Widget buildBG() => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/abc.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            ),
          ),
        ),
      );

  Widget buildSignUp(BuildContext context) => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 175,
              child: Text(
                '            Enhance Your Readability',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          GoogleSignupButtonWidget(),
          //SizedBox(height: 12),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Admin()),
              );
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            splashColor: Colors.blueGrey.shade400,
            color: Colors.blueGrey.shade100.withOpacity(0.5),
            hoverColor: Colors.green,
            child: Text("Admin", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 5),
          Text(
            'Login to continue',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Spacer(),
        ],
      );
}
