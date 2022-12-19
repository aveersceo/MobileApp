import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class grow_page extends StatefulWidget {
  const grow_page({super.key});

  @override
  State<grow_page> createState() => _grow_pageState();
}

class _grow_pageState extends State<grow_page> {
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
