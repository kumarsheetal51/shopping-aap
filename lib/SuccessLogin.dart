import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcaproject/LoginPage.dart';

class SuccessFullLogin extends StatefulWidget {
  const SuccessFullLogin({Key? key}) : super(key: key);

  @override
  State<SuccessFullLogin> createState() => _SuccessFullLoginState();
}

class _SuccessFullLoginState extends State<SuccessFullLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRV43AKHei5jvb0mVRJWJOi8cypIV764c4cg&usqp=CAU"),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()
                    )
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Click here going to!",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()
                        )
                    );
                  }, child: Text("Login",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),
                ],
              ),
            )

         
          ],
        ),
      ),
    );
  }
}
