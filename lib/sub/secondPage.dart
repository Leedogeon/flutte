import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>{
  late YoutubePlayerController controller;
  TextEditingController seekController = TextEditingController();
  @override
  void initState(){
    controller = YoutubePlayerController(
        initialVideoId: '8eqOjMcVDUs',
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
          startAt: 20,
        )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('소개영상'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap:(){
                  controller.play();
                },
                child :Container(
                  height: 50,
                  width : 120,
                  margin: const EdgeInsets.all(20),
                  color: Colors.blue,
                  child: const Center(
                    child: Text("play",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap:(){
                  controller.pause();
                },
                child :Container(
                  height: 50,
                  width : 120,
                  margin: const EdgeInsets.all(20),
                  color: Colors.blue,
                  child: const Center(
                    child: Text("pause",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

