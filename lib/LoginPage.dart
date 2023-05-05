import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProductUI.dart';
import 'UserDetails.dart';
import 'database_helper.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  bool isLoading= false;
  List<Map<String, dynamic>> lst=[];
  Future<List<Map<String, dynamic>>> getPeople() async {
    lst= (await DatabaseHelper.instance.queryAll())!;
    print("sheetal");
    print(lst);
    return lst;
  }
@override
  void initState() {
  getPeople();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text("Login Page")),
      ),
      body:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.network("https://static.vecteezy.com/system/resources/thumbnails/007/033/146/small/profile-icon-login-head-icon-vector.jpg")),
                ),
              ),

              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: TextFormField(
                  controller: emailcontroller,
                  validator: (dynamic value){
                    if(value==null || value.isEmpty){
                      return "Enter mail";
                    }else if(!RegExp("^[a-zA-Z0-9+_.-]+@gmail.com").hasMatch(value)){
                      return "please enter valid Email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
                      label: const Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: passwordcontroller,
                  obscureText: true,
                  validator: (dynamic value){
                    if(value==null || value.isEmpty){
                      return "Enter password";
                    }else if(value.length<6 && !RegExp("^[a-zA-Z0-9+_.-]+[a-zA-Z0-9.-]").hasMatch(value)){
                      return "please enter valid pass";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Password",
                      label: const Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),

                ),
              ),
              TextButton(
                onPressed: (){
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () async {
                    // getPeople();

                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => ProductScreen()));

                    if (_formKey.currentState!.validate()) {
                      lst.forEach((element) {
                        if(element["email"]==emailcontroller.text){

                          lst.forEach((element) async {
                            if(element["password"]==passwordcontroller.text){
                              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                              sharedPreferences.setBool("login", true);
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (_) => ProductScreen()));
                            }
                          });
                        }
                      });
                      // if((em==emailcontroller.text)){
                      //   if((ps==passwordcontroller.text)){
                      //
                      //     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                      //     sharedPreferences.setBool("login", true);
                      //     Navigator.push(
                      //         context, MaterialPageRoute(builder: (_) => ProductScreen()));
                      //   }
                      // }

                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                child: Row(
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => UserDetails()));

                    }, child: const Text("New User?")),
                    const Text('Create Account'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
