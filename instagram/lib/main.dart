import 'package:flutter/material.dart';
import 'package:instagram/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      theme: customTheme,
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var feedData;
  getData() async {
    var jsonData = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    if (jsonData.statusCode == 200) {
      setState(() {
        feedData = jsonDecode(jsonData.body);
      });
    } else {
      throw Exception('실패함');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: (){

            }, icon: Icon(Icons.add_box_outlined)
          )
        ],
      ),
      body: [HomePage(feedData: feedData), Text('샵페이지')][tab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i){
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '샵')
        ]
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.feedData});
  final feedData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(child: Image.network(widget.feedData[i]['image'].toString(),)),
                      ),
                      Text(widget.feedData[i]['user'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.more_horiz_outlined),
                  )
                ],
              ),
            ),
            Image.network(widget.feedData[i]['image'],),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Icon(Icons.favorite_border_outlined, size: 28),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Icon(Icons.chat_bubble_outline, size: 28),
                        ),
                        Icon(Icons.share_outlined, size: 28)
                      ],
                    ),
                    Icon(Icons.save_alt_outlined, size: 28)
                  ],
                  ),
                  Text("좋아요 ${widget.feedData[i]['likes']}개", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 2),),
                  Row(
                    children: [
                      Text(widget.feedData[i]['user'] + ' ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 2),),
                      Text(widget.feedData[i]['content'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, height: 2)),
                    ],
                  ),
                  Text(widget.feedData[i]['date'], style: TextStyle(fontSize: 12, color: Colors.grey, height: 2),)
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}