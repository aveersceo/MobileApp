import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aveers_student_poc/components/login.dart';
import 'package:appwrite/appwrite.dart';
import 'package:aveers_student_poc/variables/globals.dart' as globals;
import 'package:random_avatar/random_avatar.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class username_change extends StatefulWidget {
  const username_change({super.key});

  @override
  State<username_change> createState() => _username_changeState();
}

class _username_changeState extends State<username_change> {
  TextEditingController _newusername = TextEditingController();

  Future<void> _signup() async {
    try {
      final pb = PocketBase('http://43.204.171.125');

      String username = _newusername.text;

      final body = <String, dynamic>{
        "username": username,
        "emailVisibility": true,
        "name": username
      };
      final record = await pb.collection('users').create(body: body);
      WidgetsBinding.instance.addPostFrameCallback((_) => CherryToast.success(
            animationType: AnimationType.fromTop,
            title: Text(
              'Username updated!',
              style: TextStyle(fontFamily: 'Poppins Regular'),
            ),
            toastPosition: Position.top,
            actionHandler: () {},
          ).show(context));
      Navigator.pop(context);
    } catch (e) {
      WidgetsBinding.instance.addPostFrameCallback((_) => CherryToast.error(
            animationType: AnimationType.fromTop,
            title: Text(
              'Error!, Please Try again later.',
              style: TextStyle(fontFamily: 'Poppins Regular'),
            ),
            toastPosition: Position.top,
            actionHandler: () {},
          ).show(context));
      print(e);
    }
  }

  Future<void> _usernamechange1() async {
    try {
      final pb = PocketBase('http://43.204.171.125');
      String username = _newusername.text;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email').toString();
      String password = prefs.getString('pass').toString();
      final authData = await pb.collection('users').authWithPassword(
            email,
            password,
          );
      final body = <String, dynamic>{
        "username": username,
        "emailVisibility": true,
        "name": username
      };
      final record = await pb
          .collection('users')
          .update(pb.authStore.model.id, body: body);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Username updated!',
            style: TextStyle(fontFamily: 'Poppins Regular'),
          )));
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text(
            'Error, Please try again later!',
            style: TextStyle(fontFamily: 'Poppins Regular'),
          )));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF2F6F7),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Update Username',
              style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20.0),
            ),
            Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                                child: Center(
                                  child: TextField(
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        fontFamily: 'Poppins Regular'),
                                    controller: _newusername,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'New Username',
                                        hintStyle: TextStyle(
                                            fontFamily: 'Poppins Regular')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 40.0,
                      width: 600,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: CupertinoColors.activeBlue,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          onPressed: () {
                            _usernamechange1();
                          },
                          child: Text(
                            'Update',
                            style: TextStyle(
                                fontFamily: 'Poppins Bold', fontSize: 15.0),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
