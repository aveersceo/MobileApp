import 'package:flutter/material.dart';
import 'package:aveers_student_poc/components/login.dart';
import 'package:appwrite/appwrite.dart';
import 'package:aveers_student_poc/variables/globals.dart' as globals;
import 'package:random_avatar/random_avatar.dart';

class username_change extends StatefulWidget {
  const username_change({super.key});

  @override
  State<username_change> createState() => _username_changeState();
}

class _username_changeState extends State<username_change> {
  TextEditingController _newusername = TextEditingController();
  late final Client _client;
  late final Account _account;
  late final Databases _database;
  late final Storage _storage;

  void initState() {
    super.initState();
    _client = Client()
      ..setEndpoint('http://43.204.171.125:80/v1')
      ..setProject('6369298a96cc32391631');
    _account = Account(_client);
  }

  Future<void> _usernamechange1() async {
    try {
      await _account.updateName(name: _newusername.text);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Username updated!',
        style: TextStyle(fontFamily: 'Poppins Regular'),
      )));
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Error, Please try again later!',
            style: TextStyle(fontFamily: 'Poppins Regular'),
          )));
      Navigator.pop(context);
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
              'Update Username',
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
                                    controller: _newusername,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'New Username',
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
                              primary: Color(0xFF1E3F82),
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          onPressed: () {
                            _usernamechange1();
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
