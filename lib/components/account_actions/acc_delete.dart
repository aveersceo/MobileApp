import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aveers_student_poc/components/login.dart';
import 'package:appwrite/appwrite.dart';
import 'package:aveers_student_poc/variables/globals.dart' as globals;
import 'package:pocketbase/pocketbase.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class acc_delete extends StatefulWidget {
  const acc_delete({super.key});

  @override
  State<acc_delete> createState() => _acc_deleteState();
}

class _acc_deleteState extends State<acc_delete> {
  TextEditingController _oldpassword = TextEditingController();
  TextEditingController _newpassword = TextEditingController();

  Future<void> _accdel() async {
    try {
      final pb = PocketBase('http://43.204.171.125');
      String oldpass = _oldpassword.text;
      String newpass = _newpassword.text;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email').toString();
      String password = prefs.getString('pass').toString();
      if (oldpass == password && newpass == password) {
        final authData = await pb.collection('users').authWithPassword(
              email,
              password,
            );
        await pb.collection('users').delete(pb.authStore.model.id);
      }

      WidgetsBinding.instance.addPostFrameCallback((_) => CherryToast.success(
            animationType: AnimationType.fromTop,
            title: Text(
              'Account deleted!',
              style: TextStyle(fontFamily: 'Poppins Regular'),
            ),
            toastPosition: Position.top,
            actionHandler: () {},
          ).show(context));
      globals.isLoggedIn = false;
      Navigator.pop(context);
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
              'Delete Account',
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
                                    controller: _oldpassword,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password',
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
                                    controller: _newpassword,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Confirm Password',
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
                            _accdel();
                          },
                          child: Text(
                            'Delete',
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
