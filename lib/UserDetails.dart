import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcaproject/SuccessLogin.dart';

import 'database_helper.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController usernamecontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();

  List<Map<String, dynamic>> lst=[];
  final _formKey = GlobalKey<FormState>();


  // void insert() async {
  //   // row to insert
  //   Map<String, dynamic> row = {
  //     DatabaseHelper.name: "sheetal",
  //     DatabaseHelper.email: "kumar51@gmail.com",
  //     DatabaseHelper.phone: 7037216424,
  //     DatabaseHelper.username:"abc",
  //     DatabaseHelper.password: "asdfghj",
  //     DatabaseHelper.address : "noida"
  //   };
  //   final id = await dbHelper.insert(row);
  // }



  // void _query() async {
  //   final allRows = await dbHelper.queryAllRows();
  //   debugPrint('query all rows:');
  //   for (final row in allRows) {
  //     debugPrint(row.toString());
  //   }
  // }


  Future<void> addPerson() async {


    Map<String, dynamic> row = {
      DatabaseHelper.columnName: namecontroller.text,
      DatabaseHelper.columnemail: emailcontroller.text,
      DatabaseHelper.columnphone: phonecontroller.text.toString(),
      DatabaseHelper.columnusername: usernamecontroller.text,
      DatabaseHelper.columnpassword: passwordcontroller.text,
      DatabaseHelper.columnaddress: addresscontroller.text,
    };
    int? id = await DatabaseHelper.instance.insert(row);
  }

  // Read operation
  // Future<List<Map<String, dynamic>>> getPeople() async {
  //   lst= (await DatabaseHelper.instance.queryAll())!;
  //   print("Sheetal Kumar");
  //   print(lst);
  //   return lst;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 10),
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 10),
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
                      label: Text("Email"),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 10),
                child: TextFormField(
                  controller: phonecontroller,
                  decoration: InputDecoration(
                      label: Text("Phn no."),
                      hintText: "phn no",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 10),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      label: Text("username"),
                      hintText: "username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 10),
                child: TextFormField(
                  controller: passwordcontroller,
                  validator: (dynamic value){
                    if(value==null || value.isEmpty){
                      return "Enter password";
                    }else if(value.length<6 && !RegExp("^[a-zA-Z0-9+_.-]+[a-zA-Z0-9.-]").hasMatch(value)){
                      return "please enter valid pass";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 10),
                child: TextFormField(
                  controller: addresscontroller,
                  decoration: InputDecoration(
                      label: Text("Address"),
                      hintText: "Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width/2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                      ),
                      onPressed: (){
                        addPerson();
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) =>
                                  SuccessFullLogin()
                              )
                          );
                        }
                      }, child: Text("Confirm")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
