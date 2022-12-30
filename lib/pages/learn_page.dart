import 'package:android_intent_plus/android_intent.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:appwrite/appwrite.dart';
import 'package:pocketbase/pocketbase.dart';
import 'dart:convert';
import 'package:aveers_student_poc/variables/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class learn_page extends StatefulWidget {
  const learn_page({super.key});

  @override
  State<learn_page> createState() => _learn_pageState();
}

class _learn_pageState extends State<learn_page> {
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
    final resultList = await pb.collection('learn_basics101').getList(
          page: 1,
          perPage: 50,
        );

    var jsonb = jsonDecode(resultList.toString())['items'];
    //print(resultList);
    //print(jsonb);
    return jsonb;
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
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                dynamic vid =
                                    snapshot.data[index]['youtube_links'];
                                String thumbUrl =
                                    'https://img.youtube.com/vi/' +
                                        vid +
                                        '/0.jpg';
                                YoutubePlayerController _controller =
                                    YoutubePlayerController(
                                  initialVideoId: vid,
                                  flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),
                                );
                                String url =
                                    'https://www.youtube.com/watch?v=' + vid;
                                _launchURL() async {
                                  /*final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                  */
                                  AndroidIntent intent = AndroidIntent(
                                    action: 'action_view',
                                    data: url,
                                  );
                                  await intent.launch();
                                }

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
                                            snapshot.data[index]['course_name'],
                                            style: TextStyle(
                                                fontFamily: 'Poppins Bold'),
                                            maxLines: 2,
                                          ),
                                          children: [
                                            Container(
                                              color: Colors.black12,
                                              child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        snapshot.data[index]
                                                            ['explanation'],
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Poppins Regular'),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      YoutubePlayer(
                                                          progressIndicatorColor:
                                                              Colors.red,
                                                          controller:
                                                              _controller),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      InkWell(
                                                        onTap: _launchURL,
                                                        child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'Watch on YouTube App',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Poppins Bold',
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5.0,
                                                                  ),
                                                                  Icon(
                                                                    PhosphorIcons
                                                                        .youtubeLogoBold,
                                                                    color: Colors
                                                                        .red,
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            )
                                          ],
                                          subtitle: Text(
                                            snapshot.data[index]['subtitle'],
                                            style: TextStyle(
                                                fontFamily: 'Poppins Regular',
                                                color: Colors.black54),
                                            maxLines: 3,
                                          ),
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
                ),
                SizedBox(
                  height: 5.0,
                )
              ],
            )));
  }
}
