import 'package:aveers_student_poc/components/calender_page.dart';
import 'package:aveers_student_poc/components/login.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:aveers_student_poc/components/popup_views/profile.dart';
import 'dart:convert';
import 'dart:async';

import 'package:show_up_animation/show_up_animation.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF2F6F7),
        extendBody: true,
        body: SafeArea(
            bottom: false,
            child: ShowUpAnimation(
              delayStart: Duration(milliseconds: 50),
              animationDuration: Duration(seconds: 1),
              curve: Curves.ease,
              direction: Direction.vertical,
              offset: 0.5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Timetable',
                          style: TextStyle(
                              fontFamily: 'Poppins Bold', fontSize: 20.0),
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
                                    builder: (context) => calerder_page()),
                              );
                            },
                            icon: Icon(
                              Icons.calendar_month,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '10:00 AM',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins Bold'),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '11:00 AM',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins Bold'),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '12:00 PM',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins Bold'),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '01:00 PM',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins Bold'),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '02:00 PM',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins Bold'),
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
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '03:00 PM',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins Bold'),
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
                      style:
                          TextStyle(fontFamily: 'Poppins Bold', fontSize: 20.0),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Monday, Nov 14 : ',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  ),
                                  Text(
                                    'Maths',
                                    style: TextStyle(
                                        fontFamily: 'Poppins Regular'),
                                  ),
                                  Spacer(),
                                  Text(
                                    '10:00 AM',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  )
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    'Tuesday, Nov 15 : ',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  ),
                                  Text(
                                    'Biology',
                                    style: TextStyle(
                                        fontFamily: 'Poppins Regular'),
                                  ),
                                  Spacer(),
                                  Text(
                                    '10:00 AM',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  )
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    'Wednesday, Nov 16 : ',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  ),
                                  Text(
                                    'Computer Science',
                                    style: TextStyle(
                                        fontFamily: 'Poppins Regular'),
                                  ),
                                  Spacer(),
                                  Text(
                                    '10:00 AM',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  )
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    'Thursday, Nov 17 : ',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  ),
                                  Text(
                                    'Physics',
                                    style: TextStyle(
                                        fontFamily: 'Poppins Regular'),
                                  ),
                                  Spacer(),
                                  Text(
                                    '10:00 AM',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  )
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    'Friday, Nov 18 : ',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  ),
                                  Text(
                                    'Chemistry',
                                    style: TextStyle(
                                        fontFamily: 'Poppins Regular'),
                                  ),
                                  Spacer(),
                                  Text(
                                    '10:00 AM',
                                    style:
                                        TextStyle(fontFamily: 'Poppins Bold'),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Events',
                      style:
                          TextStyle(fontFamily: 'Poppins Bold', fontSize: 20.0),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        elevation: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'No events',
                                style: TextStyle(fontFamily: 'Poppins Regular'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
