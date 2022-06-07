import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/nexon.png',scale: 10,),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
      child: Center(
            child: Text('넥슨게임, 퍼블리싱 게임들의 플레이스타일이\n취향에 맞는다.'
                '\n\n최근 스팀쪽으로 나아갈려는 변화를 하고 있어\n 관심이 간다.',
              style: TextStyle(fontFamily: 'Jua'),
              textScaleFactor: 1.5,)
    ),
      ),

    );
  }
}