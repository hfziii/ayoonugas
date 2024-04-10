import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? doYouAgree = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Color(0xff01BCF1)),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'New Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color(0xff01BCF1)),
                hintText: 'New Passoword',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildRePassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Re-enter New Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Color(0xff01BCF1)),
                hintText: 'Re-enter New Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildAgree() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: doYouAgree,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  doYouAgree = value;
                });
              },
            ),
          ),
          Text(
            'I agree to the terms and conditions of use this application',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        onPressed:
            _navigateToSignInScreen, // Panggil fungsi navigasi saat tombol ditekan
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          primary: Colors.white,
        ),
        child: Text(
          'SIGNUP',
          style: TextStyle(
            color: Color(0xff01BCF1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _navigateToSignInScreen() {
    Navigator.pop(context); // Kembali ke halaman sebelumnya (signin)
  }

  @override
  Widget build(BuildContext context) {
     BoxDecoration backgroundDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0x6601BCF1),
          Color(0x9901BCF1),
          Color(0xcc01BCF1),
          Color(0xff01BCF1),
        ],
      ),
    );


    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: backgroundDecoration,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 20),
                      buildRePassword(),
                      SizedBox(height: 10),
                      buildAgree(),
                      buildSignupBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
