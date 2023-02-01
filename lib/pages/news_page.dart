import 'dart:convert';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;
import 'package:marquee/marquee.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class news_page extends StatefulWidget {
  const news_page({super.key});

  @override
  State<news_page> createState() => _news_pageState();
}

class _news_pageState extends State<news_page> {
  dynamic response;
  Future<List<dynamic>> fetchUsers() async {
    var result = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=technology&apiKey=77cf538be29b46949884ff5d9f6aa692"));
    //"https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=77cf538be29b46949884ff5d9f6aa692"));
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
                                  child: SizedBox(
                                    height: 200.0,
                                    child: InkWell(
                                      onTap: () {
                                        
                                        showBarModalBottomSheet(
                                          expand: false,
                                          context: context,
                                          builder: (context) => newsDetails(
                                            imgURL: snapshot.data[index]
                                                ['urlToImage'],
                                            title: snapshot.data[index]
                                                ['title'],
                                            desc: snapshot.data[index]
                                                ['description'],
                                            name: snapshot.data[index]['source']
                                                ['name'],
                                            author: snapshot.data[index]
                                                ['author'],
                                            artcUrl: snapshot.data[index]
                                                ['url'],
                                          ),
                                        );
                                      },
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          elevation: 0.5,
                                          child: Container(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0x80000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        snapshot.data[index]
                                                            ['title'],
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Poppins Bold',
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        snapshot.data[index]
                                                            ['source']['name'],
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Poppins Regular',
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        snapshot.data[index]
                                                            ['urlToImage']))),
                                          )),
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

class newsDetails extends StatelessWidget {
  final String title;
  final String imgURL;
  final String desc;
  final String author;
  final String name;
  final String artcUrl;
  newsDetails(
      {Key? key,
      required this.title,
      required this.imgURL,
      required this.desc,
      required this.name,
      required this.author,
      required this.artcUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: artcUrl,
      );
      await intent.launch();
    }

    return Container(
      color: Color(0xFFF2F6F7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: NetworkImage(
              imgURL,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style:
                        TextStyle(fontFamily: 'Poppins Bold', fontSize: 20.0),
                  ),
                ),
                Text(
                  name + ' • ' + author,
                  style: TextStyle(
                      fontFamily: 'Poppins Regular', color: Colors.black45),
                ),
                Divider(),
                Text(
                  '       ' + desc,
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(fontFamily: 'Poppins Regular', fontSize: 15.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: FloatingActionButton.extended(
                      backgroundColor: Color(0xFF1E3F82),
                      elevation: 0.5,
                      onPressed: _launchURL,
                      label: Text(
                        'Read full article',
                        style: TextStyle(
                            fontFamily: 'Poppins Regular', color: Colors.white),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
