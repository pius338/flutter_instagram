import 'package:flutter/material.dart';
import 'package:instagram/style.dart';

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
      body: [HomePage(), Text('샵페이지')][tab],
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i){
        return Feed();
      }
    );
  }
}

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 50,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(child: Image.asset('assets/cat.avif',)),
              ),
              Text('minsiki2', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Image.asset('assets/cat.avif'),
        Text('dkdkdk'),
      ],
    );
  }
}