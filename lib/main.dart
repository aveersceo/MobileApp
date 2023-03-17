import 'dart:convert';
import 'dart:ui';
import 'package:aveers_student_poc/components/notifications.dart';
import 'package:aveers_student_poc/components/popup_views/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';
import 'pages/news_page.dart';
import 'pages/help_page.dart';
import 'pages/learn_page.dart';
import 'components/profile_popup.dart';
import 'components/login.dart';
import 'components/navicon_change.dart';
import 'variables/globals.dart' as globals;
import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';

void main() {
  runApp(MaterialApp(
    home: BottomNavBar(),
    theme: ThemeData().copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.black,
          ),
    ),
  ));
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  String _pageName = 'Home';
  final pb = PocketBase('http://43.204.171.125');

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Future<void> _autologin() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email').toString();
      String password = prefs.getString('pass').toString();
      final authData = await pb.collection('users').authWithPassword(
            email,
            password,
          );
      globals.isLoggedIn = true;
      final resultList = await pb.collection('users').getList(
            page: 1,
            perPage: 50,
          );
      var jsonb = jsonDecode(resultList.toString())['items'];
      String usrname = jsonb[0]['username'].toString();
      globals.username = usrname;
      String userId = jsonb[0]['id'].toString();
      globals.userId = userId;
      /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Welcome back, ' + usrname,
            style: TextStyle(fontFamily: 'Poppins Regular'),
          )));
          */
      CherryToast.success(
        animationType: AnimationType.fromTop,
        title: Text(
          'Welcome back, ' + usrname,
          style: TextStyle(fontFamily: 'Poppins Regular'),
        ),
        toastPosition: Position.top,
        actionHandler: () {},
      ).show(context);
    } catch (e) {
      globals.isLoggedIn = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _autologin();
  }

  Widget bodyChange() {
    switch (_page) {
      case 0:
        return home_page();
      case 1:
        return news_page();
      case 2:
        return learn_page();
      case 3:
        return help_page();
      default:
        return Scaffold(backgroundColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            elevation: 2.0,
            toolbarHeight: 50.0,
            flexibleSpace: SafeArea(
                child: Center(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      PhosphorIcons.userCircleBold,
                    ),
                    tooltip: "Sign In",
                    onPressed: () {
                      if (globals.isLoggedIn == true) {
                        /*showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return profile_popup();
                            });
                            */
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => profile()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => login()),
                        );
                      }
                    },
                  ),
                  Spacer(),
                  Text(
                    _pageName,
                    style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                      splashRadius: 10.0,
                      icon: Icon(
                        PhosphorIcons.bellSimpleBold,
                      ),
                      tooltip: "Notifications",
                      onPressed: null),
                ],
              ),
            ))),
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(
              PhosphorIcons.houseSimpleBold,
              size: 25,
              color: globals.colorcont1,
            ),
            Icon(
              PhosphorIcons.newspaperBold,
              size: 25,
              color: globals.colorcont2,
            ),
            Icon(
              PhosphorIcons.bookOpenBold,
              size: 25,
              color: globals.colorcont3,
            ),
            Icon(
              PhosphorIcons.infoBold,
              size: 25,
              color: globals.colorcont4,
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: CupertinoColors.activeBlue,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              _page = index;
              globals.page4nav = index;
              if (index == 0) {
                _pageName = 'Home';
              } else if (index == 1) {
                _pageName = 'News';
              } else if (index == 2) {
                _pageName = 'Learn';
              } else if (index == 3) {
                _pageName = 'Help';
              } else if (index == 4) {
                _pageName = 'Grow';
              }
              navicon_change();
            });
          },
          letIndexChange: (index) => true,
        ),
        body: bodyChange());
  }
}
