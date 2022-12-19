import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;
import 'package:marquee/marquee.dart';
import 'package:show_up_animation/show_up_animation.dart';

class news_page extends StatefulWidget {
  const news_page({super.key});

  @override
  State<news_page> createState() => _news_pageState();
}

class _news_pageState extends State<news_page> {
  dynamic response;
  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=77cf538be29b46949884ff5d9f6aa692"));
    return jsonDecode(result.body)['articles'];
  }

  @override
  void initState() {
    response = fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF2F6F7),
        extendBody: true,
        body: SafeArea(
            top: false,
            bottom: false,
            child: Column(
              children: [
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
                            onRefresh: fetchUsers,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      5.0, 0.0, 5.0, 0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    elevation: 0.5,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Container(
                                            width: double.infinity,
                                            height: 25.0,
                                            child: Marquee(
                                              blankSpace: 20.0,
                                              velocity: 50.0,
                                              startAfter: Duration(seconds: 3),
                                              pauseAfterRound:
                                                  Duration(seconds: 3),
                                              text: snapshot.data[index]
                                                  ['title'],
                                              style: TextStyle(
                                                  fontFamily: 'Poppins Bold'),
                                              scrollAxis: Axis.horizontal,
                                            ),
                                          ),
                                          leading: SizedBox(
                                              height: 100.0,
                                              width: 100.0,
                                              child: Image(
                                                image: NetworkImage(
                                                  snapshot.data[index]
                                                      ['urlToImage'],
                                                ),
                                              )),
                                          subtitle: Text(
                                            snapshot.data[index]['description'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Poppins Regular'),
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
