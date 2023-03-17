import 'dart:convert';
import 'package:aveers_student_poc/components/account_actions/acc_delete.dart';
import 'package:aveers_student_poc/components/account_actions/update_education.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aveers_student_poc/components/account_actions/password_change.dart';
import 'package:aveers_student_poc/components/account_actions/username_change.dart';
import 'package:aveers_student_poc/components/account_actions/email_change.dart';
import 'package:flutter/material.dart';
import 'package:aveers_student_poc/components/login.dart';
import 'package:appwrite/appwrite.dart';
import 'package:aveers_student_poc/variables/globals.dart' as globals;
import 'package:jdenticon_dart/jdenticon_dart.dart';
import 'package:marquee/marquee.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  late dynamic result;
  dynamic avatar = 'robot';
  final pb = PocketBase('http://43.204.171.125');
  dynamic response;
  String pfp = globals.username;

  Future fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    String password = prefs.getString('pass').toString();
    final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );

    /*final resultList = await pb.collection('users').getList(
          page: 1,
          perPage: 50,
        );
        */
    var jsonb = jsonDecode(authData.toString())['record'];

    return jsonb;
  }

  void initState() {
    super.initState();
    response = fetchUsers();
  }

  Future<void> _logout() async {
    pb.authStore.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('pass');
    globals.isLoggedIn = false;

    WidgetsBinding.instance.addPostFrameCallback((_) => CherryToast.warning(
          animationType: AnimationType.fromTop,
          title: Text(
            'Logged out!',
            style: TextStyle(fontFamily: 'Poppins Regular'),
          ),
          toastPosition: Position.top,
          actionHandler: () {},
        ).show(context));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6F7),
      body: SafeArea(
          child: FutureBuilder(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            dynamic data = snapshot.data;
            /*final username = data[0]['username'].toString();
            final email = data[0]['email'].toString();
            final course = data[0]['course'].toString();
            final batch = data[0]['batch'].toString();
            final year = data[0]['year'].toString();
            final college = data[0]['college'].toString(); */
            final username = data['username'].toString();
            final email = data['email'].toString();
            final course = data['course'].toString();
            final batch = data['batch'].toString();
            final year = data['year'].toString();
            final college = data['college'].toString();
            final String rawSvg = Jdenticon.toSvg(username);

            return ShowUpAnimation(
              delayStart: Duration(milliseconds: 50),
              animationDuration: Duration(seconds: 1),
              curve: Curves.ease,
              direction: Direction.vertical,
              offset: 0.5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(PhosphorIcons.xCircleBold),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.5),
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 35.0,
                                  child: CircleAvatar(
                                    radius: 34.0,
                                    child: SvgPicture.string(
                                      rawSvg,
                                      width: 55.0,
                                      height: 55.0,
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                  backgroundColor: Color(0xFF1E3F82),
                                ),
                                Text(
                                  username,
                                  style: TextStyle(
                                      fontFamily: 'Poppins Bold', fontSize: 20),
                                ),
                                Text(
                                  email,
                                  style:
                                      TextStyle(fontFamily: 'Poppins Regular'),
                                ),
                                SizedBox(
                                  width: 360.0,
                                  height: 77.0,
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 250.0,
                                                child: Card(
                                                  color: Color(0xFFF2F6F7),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          'Course',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.0,
                                                        width: 250.0,
                                                        child: Container(
                                                          color: Colors.black12,
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            course,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins Regular'),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    minWidth: 100),
                                                child: Card(
                                                  elevation: 0,
                                                  color: Color(0xFFF2F6F7),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          'Year',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.0,
                                                        width: 100.0,
                                                        child: Container(
                                                          color: Colors.black12,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          year,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Regular'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  width: 360.0,
                                  height: 77.0,
                                  child: ListView(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 250.0,
                                                child: Card(
                                                  color: Color(0xFFF2F6F7),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          'College',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.0,
                                                        width: 250.0,
                                                        child: Container(
                                                          color: Colors.black12,
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            college,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins Regular'),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    minWidth: 100),
                                                child: Card(
                                                  elevation: 0,
                                                  color: Color(0xFFF2F6F7),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Text(
                                                          'Batch',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.0,
                                                        width: 100.0,
                                                        child: Container(
                                                          color: Colors.black12,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          batch,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Regular'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 5.0),
                      child: Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                onTap: () {
                                  showBarModalBottomSheet(
                                      expand: false,
                                      context: context,
                                      builder: (context) => update_education());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Update Education Details',
                                        style: TextStyle(
                                            fontFamily: 'Poppins Regular'),
                                      ),
                                      Spacer(),
                                      Icon(
                                        PhosphorIcons.caretCircleRightBold,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                onTap: () {
                                  showBarModalBottomSheet(
                                      expand: false,
                                      context: context,
                                      builder: (context) => username_change());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Change Username',
                                        style: TextStyle(
                                            fontFamily: 'Poppins Regular'),
                                      ),
                                      Spacer(),
                                      Icon(
                                        PhosphorIcons.caretCircleRightBold,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                onTap: () {
                                  showBarModalBottomSheet(
                                      expand: false,
                                      context: context,
                                      builder: (context) => password_change());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Change Password',
                                        style: TextStyle(
                                            fontFamily: 'Poppins Regular'),
                                      ),
                                      Spacer(),
                                      Icon(
                                        PhosphorIcons.caretCircleRightBold,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 5.0),
                      child: Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                onTap: () {
                                  _logout();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                            fontFamily: 'Poppins Regular',
                                            color: Colors.red),
                                      ),
                                      Spacer(),
                                      Icon(
                                        PhosphorIcons.signOutBold,
                                        color: Colors.red,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 5.0),
                      child: Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              InkWell(
                                customBorder: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                onTap: () {
                                  showBarModalBottomSheet(
                                      expand: false,
                                      context: context,
                                      builder: (context) => acc_delete());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Delete Account',
                                        style: TextStyle(
                                            fontFamily: 'Poppins Regular',
                                            color: Colors.red),
                                      ),
                                      Spacer(),
                                      Icon(
                                        PhosphorIcons.userCircleMinusBold,
                                        color: Colors.red,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: SizedBox(
              height: 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: CupertinoColors.activeBlue,
              ),
            ),
          );
        },
      )),
    );
  }
}
