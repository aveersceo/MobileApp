import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:appwrite/appwrite.dart';
import 'package:pocketbase/pocketbase.dart';
import 'dart:convert';
import 'package:aveers_student_poc/variables/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';

class shop_page extends StatefulWidget {
  const shop_page({super.key});

  @override
  State<shop_page> createState() => _shop_pageState();
}

class _shop_pageState extends State<shop_page> {
  dynamic response;
  final pb = PocketBase('http://43.204.171.125');
  TextEditingController message = TextEditingController();
  bool updateField = false;
  TextEditingController updateMsg = TextEditingController();

  Future<List<dynamic>> fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email').toString();
    String password = prefs.getString('pass').toString();
    final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );
    var result = await pb.collection('users').getOne(pb.authStore.model.id);
    //print(pb.authStore.isValid);
    //print(result);
    var jsonf = jsonDecode(result.toString());
    //print(jsonf['name']);
    final records = await pb.collection('users').getFullList(
          batch: 2,
        );
    //print(records);
    final resultList = await pb.collection('ex_data').getList(
          page: 1,
          perPage: 50,
        );

    var jsonb = jsonDecode(resultList.toString())['items'];
    //print(resultList);
    //print(jsonb);
    return jsonb;
  }

  Future<void> _upData() async {
    try {
      final body = <String, dynamic>{
        "message": message.text,
        "user": globals.userId
      };

      final record = await pb.collection('ex_data').create(body: body);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _delData(String id) async {
    try {
      await pb.collection('ex_data').delete(id);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _updateData(String user, String id) async {
    try {
      final body = <String, dynamic>{"message": updateMsg.text, "user": user};

      final record = await pb.collection('ex_data').update(id, body: body);
    } catch (e) {
      print(e);
    }
  }

  Future<List<dynamic>> fetchUsers1() async {
    final resultList = await pb.collection('ex_data').getList(
          page: 1,
          perPage: 50,
        );
    print(resultList);
    return jsonDecode(resultList.toString())['items'];
  }

  @override
  void initState() {
    super.initState();
    //fetchUsers();
    response = fetchUsers();
  }

  /* @override
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
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF2F6F7),
        extendBody: true,
        body: SafeArea(
            top: true,
            bottom: false,
            child: Column(
              children: [
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 8.0, 0),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: message,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Message',
                          prefixIcon: Icon(Icons.message_outlined),
                          hintStyle: TextStyle(fontFamily: 'Poppins Regular'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                  child: SizedBox(
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
                          _upData();
                          setState(() {
                            response = fetchUsers();
                          });
                          message.clear();
                        },
                        child: Text(
                          'Send',
                          style: TextStyle(
                              fontFamily: 'Poppins Bold', fontSize: 15.0),
                        )),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
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
                          child: RefreshIndicator(
                            onRefresh: () {
                              return Future(() {
                                setState(() {
                                  response = fetchUsers();
                                });
                              });
                            },
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      5.0, 0.0, 5.0, 0),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    elevation: 0.5,
                                    child: Column(
                                      children: [
                                        ExpansionTile(
                                            title: Text(
                                              snapshot.data[index]['message'],
                                              style: TextStyle(
                                                  fontFamily: 'Poppins Bold'),
                                              maxLines: 2,
                                            ),
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black12,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Row(
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0.0,
                                                                  0,
                                                                  8.0,
                                                                  0),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    TextField(
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Poppins Regular'),
                                                                  controller:
                                                                      updateMsg,
                                                                  textAlignVertical:
                                                                      TextAlignVertical
                                                                          .center,
                                                                  decoration: InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      hintText:
                                                                          'Updated Message',
                                                                      prefixIcon:
                                                                          Icon(Icons
                                                                              .email_outlined),
                                                                      prefixIconColor:
                                                                          Colors
                                                                              .black,
                                                                      hintStyle:
                                                                          TextStyle(
                                                                              fontFamily: 'Poppins Regular')),
                                                                ),
                                                              ),
                                                              IconButton(
                                                                  color: Color(
                                                                      0xFF1E3F82),
                                                                  onPressed:
                                                                      () {
                                                                    _updateData(
                                                                        globals
                                                                            .userId,
                                                                        snapshot.data[index]
                                                                            [
                                                                            'id']);
                                                                    updateMsg
                                                                        .clear();
                                                                    updateField =
                                                                        false;
                                                                    setState(
                                                                        () {
                                                                      updateField;
                                                                      response =
                                                                          fetchUsers();
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                      Icons
                                                                          .send))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                            subtitle: Text(
                                              snapshot.data[index]['user'],
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Poppins Regular'),
                                              maxLines: 3,
                                            ),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.upload_outlined,
                                                  color: Colors.green,
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    _delData(snapshot
                                                        .data[index]['id']);
                                                    setState(() {
                                                      response = fetchUsers();
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons.delete_outline),
                                                  color: Colors.red,
                                                )
                                              ],
                                            )),
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
                ),
                SizedBox(
                  height: 5.0,
                )
              ],
            )));
  }
}
