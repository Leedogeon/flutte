import 'package:flutter/material.dart';
import 'package:untitled/sub/thirdPage.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';
import 'sub/thirdPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      if(!controller.indexIsChanging){
        print("이전 index, ${controller.previousIndex}");
        print("현재 index, ${controller.index}");
        print("전체 탭 길이, ${controller.length}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          children: <Widget>[FirstApp(), SecondPage(),ThirdApp()],
          controller: controller,
        ),
        bottomNavigationBar: TabBar(tabs: <Tab>[
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue),),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue),),
          Tab(icon: Icon(Icons.looks_3,color:Colors.blue),),
        ], controller: controller,
        )
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
