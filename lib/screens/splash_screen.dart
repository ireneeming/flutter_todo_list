import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_todo_list/screens/list_screen.dart';
import 'package:flutter_todo_list/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    // 값을 가져오는동안 비동기처리로 Future 타입의 함수로 지정.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin =
        prefs.getBool('isLogin') ?? false; // isLogin이 null인 경우 false 처리
    print('[*] isLogin : ' + isLogin.toString());
    return isLogin;
  }

  @override
  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ListScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  void initState() {
// initState()와 같이 StatefulWidget에는 위젯의 생성부터 소멸까지 생애주기를 다루는 메서드들이 있다.
// 이 메서드들을 위젯이 처음 생성될 때나 사라질 때, 무언가 변화가 발생할 때 등 정해진 때 알아서 실행되는 메서드다.
// 이를 적절히 활용하면 원하는 순간에 원하는 함수 등을 실행시킬 수 있다.

    super.initState();
    Timer(Duration(seconds: 2), () {
      moveScreen();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'SplashScreen',
            style: TextStyle(fontSize: 20),
          ),
          Text('나만의 일정 관ㅣ : TODO 리스트 앱', style: TextStyle(fontSize: 20)),
        ]),
      ),
    );
  }
}
