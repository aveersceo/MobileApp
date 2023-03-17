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

class update_education extends StatefulWidget {
  const update_education({super.key});

  @override
  State<update_education> createState() => _update_educationState();
}

class _update_educationState extends State<update_education> {
  TextEditingController course = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController college = TextEditingController();
  TextEditingController batch = TextEditingController();

  Future<void> _upedu() async {
    try {
      final pb = PocketBase('http://43.204.171.125');

      String scourse = course.text;
      String syear = year.text;
      String scollege = college.text;
      String sbatch = batch.text;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email').toString();
      String password = prefs.getString('pass').toString();
      final authData = await pb.collection('users').authWithPassword(
            email,
            password,
          );

      final body = <String, dynamic>{
        "course": scourse,
        "year": syear,
        "college": scollege,
        "batch": sbatch
      };
      final record = await pb
          .collection('users')
          .update(pb.authStore.model.id, body: body);
      WidgetsBinding.instance.addPostFrameCallback((_) => CherryToast.success(
            animationType: AnimationType.fromTop,
            title: Text(
              'Education details updated!',
              style: TextStyle(fontFamily: 'Poppins Regular'),
            ),
            toastPosition: Position.top,
            actionHandler: () {},
          ).show(context));
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
      print(e);
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
              'Update Education Details',
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
                                    controller: college,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'College',
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
                                    controller: course,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Course (Ex: B.Tech IT)',
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
                                    controller: year,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Year (Ex: II Year)',
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
                                    controller: batch,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Batch (Ex: 2019 - 2023)',
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
                            _upedu();
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
