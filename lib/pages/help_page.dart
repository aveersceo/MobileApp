import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'dart:convert';
import 'package:jdenticon_dart/jdenticon_dart.dart';
import 'package:openai_gpt3_api/openai_gpt3_api.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class help_page extends StatefulWidget {
  const help_page({super.key});

  @override
  State<help_page> createState() => _help_pageState();
}

class _help_pageState extends State<help_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F6F7),
      extendBody: true,
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text(
                'Emergency Services',
                style: TextStyle(fontFamily: 'Poppins Regular'),
              ),
              subtitle:
                  Text('100', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Police',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('101', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Ambulance',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('102', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Fire Brigade',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('103', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Women Helpline',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('1090', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Child Helpline',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('1098', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('fire control room',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('101', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Domestic abuse and sexual violence',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('181', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Anti-poison help line',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('1066', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('For Psychological Support Helpline No',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle: Text('08046110007',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('National Tobacco Quit-line	',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle: Text('1800-11-2356',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Indian Railways National Security Helpline',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle:
                  Text('182', style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.phoneFill),
              title: Text('Anti ragging',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle: Text('1800 180 5522',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            ListTile(
              leading: Icon(PhosphorIcons.atBold),
              title: Text('for queries regarding use/login mail us',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
              subtitle: Text('aveersceo@gmail.com',
                  style: TextStyle(fontFamily: 'Poppins Regular')),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
