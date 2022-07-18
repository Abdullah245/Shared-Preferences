import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_pref/home.dart';
import 'package:shared_pref/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late String finalEmail;
  late String finalPassword;
  Future getVaildationData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var obtainEmail = pref.getString('email');
    var obtainPassword = pref.getString('password');
    setState(() {
      finalEmail = obtainEmail!;
      finalPassword = obtainPassword!;
    });
    print(finalEmail);
    print(finalPassword);
  }

  @override
  void initState() {
    super.initState();
    getVaildationData().whenComplete(() async {
      Timer(
          Duration(seconds: 5),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      finalEmail == null ? LoginDemo() : Home())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child: FlutterLogo(size: MediaQuery.of(context).size.height));
  }
}
