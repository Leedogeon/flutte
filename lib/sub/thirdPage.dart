import 'dart:async';
import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdApp extends StatelessWidget {
  const ThirdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: '출처');
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void>? _launched;

  AudioCache audioCache=AudioCache();

  @override
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }


  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    // onPressed calls using this URL are not gated on a 'canLaunch' check
    // because the assumption is that every device can launch a web URL.
    final Uri toLaunch =
    Uri(scheme: 'https', host: 'www.youtube.com',path: 'embed/txL-itZYdY4');
    final Uri toLaunch2 =
    Uri(scheme: 'https',host: 'pub.dev',path: 'packages/url_launcher');
    final Uri toLaunch3 =
    Uri(scheme: 'https',host: 'github.com',path: 'rollcake86/DoitFlutter2.0/tree/master/Chapter5/tabbar_example');
    final Uri toLaunch4 =
    Uri(scheme: 'https',host: 'www.youtube.com',path: 'embed/CWOqeR6Pjdc');
    final Uri toLaunch5 =
    Uri(scheme: 'https',host: 'fonts.google.com');
    final Uri toLaunch6 =
    Uri(scheme: 'https', host: 'www.youtube.com',path: 'embed/tTZ4yfpWDGI');
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/info.png',scale: 11,),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
      child: const Text("출처",textScaleFactor: 1,style: TextStyle(fontSize: 20),),
        onPressed:(){

          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: const Text("출처"),
              titleTextStyle:
              const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,fontSize: 30),
              actionsOverflowButtonSpacing: 20,
              actions: [
                ElevatedButton(
                  onPressed: () => setState(() {
                    audioCache.play('pop.mp3');
                    _launched = _launchInBrowser(toLaunch);
                  }),
                  child: const Text('비디오'),
                ),
                ElevatedButton(
                onPressed: () => setState(() {
                  audioCache.play('pop.mp3');
            _launched = _launchInBrowser(toLaunch2);
            }),
            child: const Text('URL'),
            ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    audioCache.play('pop.mp3');
                    _launched = _launchInBrowser(toLaunch3);
                  }),
                  child: const Text('페이지이동'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    audioCache.play('pop.mp3');
                    _launched = _launchInBrowser(toLaunch4);
                  }),
                  child: const Text('아이콘'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    audioCache.play('pop.mp3');
                    _launched = _launchInBrowser(toLaunch5);
                  }),
                  child: const Text('폰트'),
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    audioCache.play('pop.mp3');
                    _launched = _launchInBrowser(toLaunch6);
                  }),
                  child: const Text('사운드'),
                ),
                ElevatedButton(onPressed: (){
                  audioCache.play('pop.mp3');
                  Navigator.of(context).pop();
                }, child: const Text("Close")),
              ],

              content: const Text("버튼 클릭시 이동됩니다"),
            );
          });
        }
    ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                onPressed: () => setState(() {
                  audioCache.play('pop.mp3');
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("이도건"),
                      titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      content: Text("소프트웨어학과\n2017748065",
                      style: TextStyle(color: Colors.white)),
                    );
                  });
                }),
                child: const Text('정보',textScaleFactor: 1,style: TextStyle(fontSize: 20),),
              ),

              const Padding(padding: EdgeInsets.all(16.0)),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),
            ],
          ),
        ],
      ),
    );
  }
}