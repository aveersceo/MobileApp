// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aveers_student_poc/components/calender_page.dart';
import 'package:aveers_student_poc/components/login.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:aveers_student_poc/components/popup_views/profile.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:convert';
import 'dart:async';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final pb = PocketBase('http://43.204.171.125');
  dynamic response;
  dynamic responseCollege;

  Future<List<dynamic>> fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    String password = prefs.getString('pass').toString();
    final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );
    final resultList = await pb.collection('exams_data').getList(
          page: 1,
          perPage: 50,
        );
    var jsonExm = jsonDecode(resultList.toString())['items'];
    return jsonExm;
  }

  Future<List<dynamic>> fetchCollege() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    String password = prefs.getString('pass').toString();
    final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );
    final resultList = await pb.collection('colleges').getList(
          expand: 'vcet_courses',
          page: 1,
          perPage: 50,
        );
    var jsonCollege = jsonDecode(resultList.toString())['items'];
    return jsonCollege;
  }

  void initState() {
    super.initState();
    response = fetchUsers();
    responseCollege = fetchCollege();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF2F6F7),
        extendBody: true,
        body: SafeArea(
            bottom: false,
            child: FutureBuilder(
                future: response,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ShowUpAnimation(
                      delayStart: Duration(milliseconds: 50),
                      animationDuration: Duration(seconds: 1),
                      curve: Curves.ease,
                      direction: Direction.vertical,
                      offset: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 5.0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Timetable',
                                      style: TextStyle(
                                          fontFamily: 'Poppins Bold',
                                          fontSize: 20.0),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        tooltip: 'Calender',
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    calerder_page()),
                                          );
                                        },
                                        icon: Icon(
                                          PhosphorIcons.calendarBold,
                                          size: 25.0,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 70.0,
                                  child: ListView(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Card(
                                        elevation: 0.5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IntrinsicHeight(
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '10:00 AM',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                        Text(
                                                          'Physics',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Regular'),
                                                        )
                                                      ],
                                                    ),
                                                    VerticalDivider(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '11:00 AM',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                        Text(
                                                          'Chemistry',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Regular'),
                                                        )
                                                      ],
                                                    ),
                                                    VerticalDivider(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '12:00 PM',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                        Text(
                                                          'Maths',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Regular'),
                                                        )
                                                      ],
                                                    ),
                                                    VerticalDivider(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '01:00 PM',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                        Text(
                                                          'Lunch',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Regular'),
                                                        )
                                                      ],
                                                    ),
                                                    VerticalDivider(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '02:00 PM',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                        Text(
                                                          'Computer Science',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Regular'),
                                                        )
                                                      ],
                                                    ),
                                                    VerticalDivider(),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '03:00 PM',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold'),
                                                        ),
                                                        Text(
                                                          'Biology',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Regular'),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Exams',
                                  style: TextStyle(
                                      fontFamily: 'Poppins Bold',
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 190.0,
                                  child: Card(
                                    elevation: 0.5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Row(
                                                children: [
                                                  Text(
                                                    snapshot.data[index]
                                                        ['date'],
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins Bold'),
                                                  ),
                                                  SizedBox(width: 10.0),
                                                  Text(
                                                    snapshot.data[index]
                                                        ['subject'],
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins Regular'),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    snapshot.data[index]
                                                        ['time'],
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Poppins Bold'),
                                                  )
                                                ],
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    Divider(),
                                            itemCount: snapshot.data.length)),
                                  ),
                                ),
                                Text(
                                  'Courses',
                                  style: TextStyle(
                                      fontFamily: 'Poppins Bold',
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    elevation: 0.5,
                                    child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: FutureBuilder(
                                            future: fetchCollege(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.hasData) {
                                                return ListView.builder(
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return ExpansionTile(
                                                        title: Text(
                                                          snapshot.data[index]
                                                              ['name'],
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins Bold',
                                                              fontSize: 15.0),
                                                        ),
                                                      );
                                                    },
                                                    itemCount:
                                                        snapshot.data.length);
                                              } else {
                                                return Center(
                                                  child: SizedBox(
                                                    height: 25.0,
                                                    width: 25.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2.0,
                                                      color: Color(0xFF1E3F82),
                                                    ),
                                                  ),
                                                );
                                              }
                                            })),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: Color(0xFF1E3F82),
                        ),
                      ),
                    );
                  }
                })));
  }
}
