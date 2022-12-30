import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'dart:convert';
import 'package:jdenticon_dart/jdenticon_dart.dart';
import 'package:openai_gpt3_api/openai_gpt3_api.dart';

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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/5130/5130142.png',
                scale: 5.0,
              ),
            ],
          ),
        ));
  }
}
