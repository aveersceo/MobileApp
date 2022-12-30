import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:show_up_animation/show_up_animation.dart';

class notification_page extends StatefulWidget {
  const notification_page({super.key});

  @override
  State<notification_page> createState() => _notification_pageState();
}

class _notification_pageState extends State<notification_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF2F6F7),
        extendBody: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  tileColor: Colors.white,
                  leading: Icon(PhosphorIcons.bellRingingBold),
                  title: Text(
                    'Test Notification',
                    style: TextStyle(fontFamily: 'Poppins Bold'),
                  ),
                  subtitle: Text(
                    'Text notification description',
                    style: TextStyle(fontFamily: 'Poppins Regular'),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  tileColor: Colors.white,
                  leading: Icon(
                    PhosphorIcons.warningCircleBold,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Test Notification 2',
                    style: TextStyle(fontFamily: 'Poppins Bold'),
                  ),
                  subtitle: Text(
                    'Text notification description 2',
                    style: TextStyle(fontFamily: 'Poppins Regular'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
