import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aveers_student_poc/main.dart';
import 'package:aveers_student_poc/variables/globals.dart' as globals;
import 'package:appwrite/appwrite.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;

  Future<void> _login() async {
    try {
      String email = _email.text;
      String password = _password.text;
      globals.tempEmail = email;
      globals.tempPass = password;
      final pb = PocketBase('http://43.204.171.125');
      final authData = await pb.collection('users').authWithPassword(
            email,
            password,
          );
      final resultList = await pb.collection('users').getList(
            page: 1,
            perPage: 50,
          );
      var jsonb = jsonDecode(resultList.toString())['items'];
      String usrname = jsonb[0]['username'].toString();
      globals.username = usrname;
      String userId = jsonb[0]['id'].toString();
      globals.userId = userId;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.lightGreen,
          content: Text(
            'Logged in succesfully!',
            style: TextStyle(fontFamily: 'Poppins Regular'),
          )));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      prefs.setString('pass', password);
      globals.isLoggedIn = true;
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'This Email and Password does not match! Please try again.',
            style: TextStyle(fontFamily: 'Poppins Regular'),
          )));
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Center(
                  child: SingleChildScrollView(
            child: ShowUpAnimation(
              delayStart: Duration(milliseconds: 50),
              animationDuration: Duration(seconds: 1),
              curve: Curves.ease,
              direction: Direction.vertical,
              offset: 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                    elevation: 0.5,
                    color: Color(0xccffffff),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/student2.gif",
                            width: 150,
                            height: 150,
                          ),
                          const Text(
                            "Welcome back, you've been missed!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins Bold', fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                            child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 8.0, 0),
                                        child: TextField(
                                          style: TextStyle(
                                              fontFamily: 'Poppins Regular'),
                                          controller: _email,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Email',
                                              prefixIcon:
                                                  Icon(Icons.email_outlined),
                                              prefixIconColor: Colors.black,
                                              hintStyle: TextStyle(
                                                  fontFamily:
                                                      'Poppins Regular')),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0.0, 0, 8.0, 0),
                                child: TextField(
                                  style:
                                      TextStyle(fontFamily: 'Poppins Regular'),
                                  controller: _password,
                                  obscureText: _obscureText,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.password_outlined),
                                      hintStyle: TextStyle(
                                          fontFamily: 'Poppins Regular'),
                                      suffixIcon: IconButton(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        icon: _obscureText
                                            ? Icon(
                                                Icons.visibility_off_outlined)
                                            : Icon(Icons.visibility_outlined),
                                        onPressed: () {
                                          _obscureText = !_obscureText;
                                          setState(() {});
                                        },
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                            child: SizedBox(
                              height: 40.0,
                              width: 600,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF1E3F82),
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  onPressed: () {
                                    _login();
                                  },
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontFamily: 'Poppins Bold',
                                        fontSize: 15.0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(fontFamily: 'Poppins Regular'),
                      ),
                      GestureDetector(
                        child: Text(
                          ' Register Now',
                          style: TextStyle(
                              fontFamily: 'Poppins Bold',
                              color: Color(0xFF1E3F82)),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => register()),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ))),
        )
      ],
    );
  }
}

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  bool _obscureText = true;

  Future<void> _signup() async {
    try {
      final pb = PocketBase('http://43.204.171.125');
      String email = _email.text;
      String username = _name.text;
      String password = _password.text;
      final body = <String, dynamic>{
        "username": username,
        "email": email,
        "emailVisibility": true,
        "password": password,
        "passwordConfirm": password,
        "name": username
      };
      final record = await pb.collection('users').create(body: body);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Account created succesfully!',
        style: TextStyle(fontFamily: 'Poppins Regular'),
      )));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Account couldnot be created! Please try again.',
            style: TextStyle(fontFamily: 'Poppins Regular'),
          )));
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Center(
                  child: SingleChildScrollView(
            child: ShowUpAnimation(
              delayStart: Duration(milliseconds: 50),
              animationDuration: Duration(seconds: 1),
              curve: Curves.ease,
              direction: Direction.vertical,
              offset: 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                    elevation: 0.5,
                    color: Color(0xccffffff),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/student2.gif",
                            width: 150,
                            height: 150,
                          ),
                          const Text(
                            "Register below with your details!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Poppins Bold', fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                            child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0.0, 0, 8.0, 0),
                                        child: TextField(
                                          controller: _email,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: TextStyle(
                                              fontFamily: 'Poppins Regular'),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon:
                                                  Icon(Icons.email_outlined),
                                              hintText: 'Email',
                                              hintStyle: TextStyle(
                                                  fontFamily:
                                                      'Poppins Regular')),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0.0, 0, 8.0, 0),
                                child: TextField(
                                  controller: _name,
                                  textAlignVertical: TextAlignVertical.center,
                                  style:
                                      TextStyle(fontFamily: 'Poppins Regular'),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Name',
                                      prefixIcon: Icon(Icons.person_outline),
                                      hintStyle: TextStyle(
                                          fontFamily: 'Poppins Regular')),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0.0, 0, 8.0, 0),
                                child: TextField(
                                  obscureText: _obscureText,
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: _password,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.password_outlined),
                                      hintStyle: TextStyle(
                                          fontFamily: 'Poppins Regular'),
                                      suffixIcon: IconButton(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        icon: _obscureText
                                            ? Icon(
                                                Icons.visibility_off_outlined)
                                            : Icon(Icons.visibility_outlined),
                                        onPressed: () {
                                          _obscureText = !_obscureText;
                                          setState(() {});
                                        },
                                      )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                            child: SizedBox(
                              height: 40.0,
                              width: 600,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF1E3F82),
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  onPressed: () {
                                    String value = _password.text;
                                    if (value.length > 7) {
                                      _signup();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                        'Password must have minimum 8 characters!',
                                        style: TextStyle(
                                            fontFamily: 'Poppins Regular'),
                                      )));
                                    }
                                  },
                                  child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        fontFamily: 'Poppins Bold',
                                        fontSize: 15.0),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(fontFamily: 'Poppins Regular'),
                      ),
                      GestureDetector(
                        child: Text(
                          ' Login',
                          style: TextStyle(
                              fontFamily: 'Poppins Bold',
                              color: Color(0xFF1E3F82)),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ))),
        )
      ],
    );
  }
}
