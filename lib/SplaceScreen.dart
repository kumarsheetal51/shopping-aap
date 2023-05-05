import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPage.dart';
import 'ProductUI.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {

  String img="https://img.freepik.com/premium-vector/online-shop-logo-designs-concept-vector-online-store-logo-designs_7649-661.jpg?w=740";
  bool ischeck=false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var status = prefs.getBool('login');
      if(status==true){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ProductScreen()
            )
        );
      }else{
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginPage()
            )
        );
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,

                child: Container(
                    child: Image.network(img))),
          ),
          Center(child: CircularProgressIndicator()),

        ],
      ),
    );
  }
}
