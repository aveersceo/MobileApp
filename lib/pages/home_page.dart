import 'package:aveers_student_poc/components/calender_page.dart';
import 'package:aveers_student_poc/components/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:aveers_student_poc/components/popup_views/profile.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:convert';
import 'dart:async';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../components/edit_calender.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final pb = PocketBase('http://43.204.171.125');
  dynamic response;
  dynamic response2;
  dynamic response3;
  var items = [
    'Select College',
    'SUNBEAM COLLEGE FOR WOMAN',
    'VELALAR COLLEGE OF ENGINEERNING AND TECHNOLOGY',
    'VELLALAR COLLEGE OF ARTS AND SCIENCE',
    'VELLALAR COLLEGE OF WOMEN',
    'VELALAR COLLEGE OF PHARMACY',
  ];
  var courses = [
    'Select Course',
    'B.Tech  INFOMATION TECHNOLOGY',
    'B.E  COMPUTER SCIENCE',
    'B.E  ELECTROINCS & COMMUNICATIONS ENGINEERING ',
    'B.E  ELETRICAL & ELECTROINCS ENGINEERING',
    'B.E  CIVIL ENGINEERING'
  ];
  var years = [
    'Select Year',
    '1st YEAR',
    '2nd YEAR',
    '3rd YEAR',
    '4th YEAR',
  ];

  String defvalue = 'Select College';
  String crdefvalue = 'Select Course';
  String yrdefvalue = 'Select Year';

  Future<List<dynamic>> fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    String password = prefs.getString('pass').toString();
    /*final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );
        */
    final resultList = await pb.collection('exams_data').getList(
          page: 1,
          perPage: 50,
        );
    var jsonb = jsonDecode(resultList.toString())['items'];

    return jsonb;
  }

  Future<List<dynamic>> fetchCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    String password = prefs.getString('pass').toString();
    /*final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );
        */
    final resultList = await pb.collection('colleges').getList(
          page: 1,
          perPage: 50,
        );
    var jsonb = jsonDecode(resultList.toString())['items'];

    return jsonb;
  }

  Future<List<dynamic>> fetchtimetable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    String password = prefs.getString('pass').toString();
    /*final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );
        */
    final resultList = await pb.collection('timetable_data').getList(
          page: 1,
          perPage: 50,
        );
    var jsonb = jsonDecode(resultList.toString())['items'];

    return jsonb;
  }

  void initState() {
    super.initState();
    response = fetchUsers();
    response2 = fetchtimetable();
    response3 = fetchCourses();
  }

  Color getColor(Set<MaterialState> states) {
    return Colors.grey;
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
                        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        child: SingleChildScrollView(
                          child: Column(
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
                                  /* IconButton(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      tooltip: 'Edit',
                                      onPressed: () {
                                        showBarModalBottomSheet(
                                            expand: false,
                                            context: context,
                                            builder: (context) =>
                                                edit_calender());
                                      },
                                      icon: Icon(
                                        PhosphorIcons.pencilBold,
                                        size: 25.0,
                                      ))
                                      */
                                ],
                              ),
                              Card(
                                elevation: 0.5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
                                    child: FutureBuilder(
                                        future: response2,
                                        builder: (BuildContext context,
                                            AsyncSnapshot snapshot) {
                                          return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              physics: BouncingScrollPhysics(),
                                              //scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Table(
                                                  border: TableBorder(
                                                      horizontalInside:
                                                          BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.grey),
                                                      verticalInside:
                                                          BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  Colors.grey)),
                                                  children: [
                                                    TableRow(
                                                        decoration: BoxDecoration(
                                                            color: (index % 2 ==
                                                                    0)
                                                                ? Colors.white
                                                                : Colors
                                                                    .black12),
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              snapshot.data[
                                                                  index]['day'],
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins Bold',
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              snapshot.data[
                                                                      index]
                                                                  ['sub1'],
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins Regular'),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              snapshot.data[
                                                                      index]
                                                                  ['sub2'],
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins Regular'),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              snapshot.data[
                                                                      index]
                                                                  ['sub3'],
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins Regular'),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              snapshot.data[
                                                                      index]
                                                                  ['sub4'],
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins Regular'),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              snapshot.data[
                                                                      index]
                                                                  ['sub5'],
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins Regular'),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              snapshot.data[
                                                                      index]
                                                                  ['sub6'],
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins Regular'),
                                                            ),
                                                          ),
                                                        ])
                                                  ],
                                                );
                                              },
                                              itemCount: snapshot.data.length);
                                        })),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Exams',
                                    style: TextStyle(
                                        fontFamily: 'Poppins Bold',
                                        fontSize: 20.0),
                                  ),
                                  Spacer(),
                                  /* IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  calerder_page()),
                                        );
                                      },
                                      icon: Icon(PhosphorIcons.calendarBold))
                                      */
                                ],
                              ),
                              Card(
                                elevation: 0.5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              Text(
                                                snapshot.data[index]['date'],
                                                style: TextStyle(
                                                    fontFamily: 'Poppins Bold'),
                                              ),
                                              SizedBox(width: 10.0),
                                              Text(
                                                snapshot.data[index]['subject'],
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Poppins Regular'),
                                              ),
                                              Spacer(),
                                              Text(
                                                snapshot.data[index]['time'],
                                                style: TextStyle(
                                                    fontFamily: 'Poppins Bold'),
                                              )
                                            ],
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                Divider(),
                                        itemCount: snapshot.data.length)),
                              ),
                              Text(
                                'Courses',
                                style: TextStyle(
                                    fontFamily: 'Poppins Bold', fontSize: 20.0),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    FutureBuilder(
                                      future: response3,
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          return ShowUpAnimation(
                                            delayStart:
                                                Duration(milliseconds: 50),
                                            animationDuration:
                                                Duration(seconds: 1),
                                            curve: Curves.ease,
                                            direction: Direction.vertical,
                                            offset: 0.5,
                                            child: RefreshIndicator(
                                              onRefresh: () {
                                                return Future(() {
                                                  setState(() {
                                                    response = fetchUsers();
                                                  });
                                                });
                                              },
                                              child: ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: snapshot.data.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        5.0, 0.0, 5.0, 0),
                                                    child: Card(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      10.0))),
                                                      elevation: 0.5,
                                                      child: Column(
                                                        children: [
                                                          ExpansionTile(
                                                            title: Text(
                                                              snapshot.data[
                                                                      index]
                                                                  ['name'],
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Poppins Bold'),
                                                              maxLines: 2,
                                                            ),
                                                            children: [
                                                              Container(
                                                                color: Colors
                                                                    .black12,
                                                                width: double
                                                                    .infinity,
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Text(
                                                                          'UG Courses',
                                                                          style:
                                                                              TextStyle(fontFamily: 'Poppins Bold'),
                                                                        ),
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            snapshot.data[index]['ug'],
                                                                            style:
                                                                                TextStyle(fontFamily: 'Poppins Regular'),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'PG Courses',
                                                                          style:
                                                                              TextStyle(fontFamily: 'Poppins Bold'),
                                                                        ),
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            snapshot.data[index]['pg'],
                                                                            style:
                                                                                TextStyle(fontFamily: 'Poppins Regular'),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10.0,
                                                                        ),
                                                                      ],
                                                                    )),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
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
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 55.0)
                            ],
                          ),
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
                          color: CupertinoColors.activeBlue,
                        ),
                      ),
                    );
                  }
                })));
  }
}
