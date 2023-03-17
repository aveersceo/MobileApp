import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:aveers_student_poc/variables/globals.dart' as globals;
import 'package:aveers_student_poc/components/login.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:aveers_student_poc/components/popup_views/profile.dart';
import 'package:pocketbase/pocketbase.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';

class profile_popup extends StatefulWidget {
  const profile_popup({super.key});

  @override
  State<profile_popup> createState() => _profile_popupState();
}

class _profile_popupState extends State<profile_popup> {
  late dynamic result;
  dynamic avatar = 'robot';
  final pb = PocketBase('http://43.204.171.125');
  dynamic response;
  final String rawSvg = Jdenticon.toSvg(globals.username);

  Future<void> _logout() async {
    pb.authStore.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('pass');
    globals.isLoggedIn = false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Colors.white,
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  child: Column(children: [
                CircleAvatar(
                  radius: 25.0,
                  child: CircleAvatar(
                    radius: 24.0,
                    child: SvgPicture.string(
                      rawSvg,
                      width: 40.0,
                      height: 40.0,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  backgroundColor: Color(0xFF1E3F82),
                ),
                Text(
                  globals.username,
                  style: TextStyle(fontFamily: 'Poppins Bold'),
                ),
              ])),
              Divider(),
              InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profile()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.userBold,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontFamily: 'Poppins Regular', color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.gearSixBold,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontFamily: 'Poppins Regular', color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onTap: () {
                  _logout();
                  globals.isLoggedIn = false;
                  WidgetsBinding.instance
                      .addPostFrameCallback((_) => CherryToast.warning(
                            title: Text(
                              'Logged out!',
                              style: TextStyle(fontFamily: 'Poppins Regular'),
                            ),
                            toastPosition: Position.bottom,
                            actionHandler: () {},
                          ).show(context));

                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        PhosphorIcons.signOutBold,
                        color: Colors.red,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontFamily: 'Poppins Regular', color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
