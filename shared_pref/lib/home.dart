import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_pref/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: ElevatedButton(
            onPressed: () async {
              final SharedPreferences pref =
                  await SharedPreferences.getInstance();
              pref.remove('email');
              pref.remove('password');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginDemo()));
            },
            child: Text("Logout")),
        height: 200,
        width: 200,
      )),
    );
  }
}
