import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appayoonugas/signup.dart';
import 'package:appayoonugas/pages/homepage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isRememberMe = false;

  void _navigateToHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()), // Replace 'HomePage()' with your actual homepage class
    );
  }

  void _navigateToSignUpScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

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
          'Password',
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
                hintText: 'Passoword',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Fogot Password pressed"),
        // padding: EdgeInsets.only(right: 0),
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // Check the login credentials (you need to implement this logic)
        bool loginSuccess = true; // Replace with your actual login logic

        if (loginSuccess) {
          _navigateToHomePage(); // Navigate to the homepage if login is successful
        } else {
          print('Login failed'); // You can show an error message or perform other actions here
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        primary: Colors.white,
      ),
      child: Text(
        'LOGIN',
        style: TextStyle(
          color: Color(0xff01BCF1),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
  }


  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: _navigateToSignUpScreen,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0x6601BCF1),
                    Color(0x9901BCF1),
                    Color(0xcc01BCF1),
                    Color(0xff01BCF1),
                  ])),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      buildForgotPassBtn(),
                      buildRememberCb(),
                      buildLoginBtn(),
                      buildSignUpBtn(),
                    ]),
              ),
            )
          ],
        )),
      ),
    );
  }
}