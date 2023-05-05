import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CardData.dart' as crd;
import 'CardData.dart';
import 'ShooseDetails.dart';
import 'CameraDetails.dart';
import 'LoginPage.dart';
import 'AppleDetails.dart';
import 'HandbagsDetails.dart';
import 'OnePlus.dart';
import 'IPhoneDetails.dart';
import 'OnePlusMobile.dart';
import 'DellDetails.dart';

int count = 0;
num total=0;

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  State<ProductScreen> createState() => ProductScreenState();
}
class ProductScreenState extends State<ProductScreen> {


  bool cheack=true;
  bool cheack1=true;
  bool cheack2=true;
  bool cheack3=true;
  bool cheack4=true;
  bool cheack5=true;
  bool cheack6=true;
  bool cheack7=true;
  bool cheack8=true;

  List<dynamic?> adddata=[];

  List<dynamic> image=["https://images.pexels.com/photos/249597/pexels-photo-249597.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/611qRhHS5NL._UL1140_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71Raw8VUk5L._UL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/514NPRZ1AQL._SX679_.jpg",
  ];

  List<dynamic> image1=[
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/514NPRZ1AQL._SL1500_.jpg",];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Products")),
        actions: <Widget>[
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Cards()));

                    // do something
                  },
                ),
              ),


              count>0 ? Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("${count}",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              ) : Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              )
            ],

          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader( // <-- SEE HERE
              decoration: BoxDecoration(color: const Color(0xff764abc)),
              accountName: Text(
                "Sheetal Kumar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Kumarsheetal51@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(onPressed: () async {
              SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
              sharedPreferences.setBool("login", false);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
            }, child: Text("LogOut"))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CameraDetails()));
                },
                child: Card(
                  borderOnForeground: true,
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            height: 300,
                            child: Card(
                                elevation: 5,
                                child: Image.network("${image[0]}"))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Camera",style: TextStyle(fontSize: 15),),
                            Text("₹25000",style: TextStyle(fontSize: 20),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:cheack ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count +=1;
                                    cheack=false;
                                   // obj.cardimage.add("${image[0]}");
                                    crd.cardimage.add("${image[0]}");
                                    crd.cardname.add("Camera");
                                    crd.cardprise.add(25000);
                                    crd.cheacker=true;
                                    total+=25000;

                                    print("--->Sheetal");
                                   // print(obj.cardimage);
                                    setState(() {
                                    });
                                  }, child: Text("Add")) : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count-=1;
                                    cheack=true;
                                  //  obj.cardimage.remove("${image[0]}");
                                    crd.cardimage.remove("${image[0]}");
                                    crd.cardname.remove("Camera");
                                    crd.cardprise.remove(25000);
                                    crd.cheacker=false;
                                    total-=25000;
                                    print("--->Sheetal sharma");
                                   // print(obj.cardimage);
                                    setState(() {
                                    });
                                  }, child: Text("Remove")) ,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ShooseDetails()));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            height: 300,
                            child: Card(
                                elevation: 5,
                                child: Image.network("${image[1]}"))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Air Jordan 4 Retro",style: TextStyle(fontSize: 15),),
                            Text("₹62,662",style: TextStyle(fontSize: 20),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:cheack1 ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count+=1;
                                    cheack1=false;
                                    crd.cardimage.add("${image[1]}");
                                    crd.cardname.add("Air Jordan 4 Retro");
                                    crd.cardprise.add(62662);
                                    crd.cheacker=true;
                                    total+=62662;
                                    setState(() {
                                    });
                                  }, child: Text("Add")) : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){

                                    count-=1;
                                    cheack1=true;
                                    crd.cardimage.remove("${image[1]}");
                                    crd.cardname.remove("Air Jordan 4 Retro");
                                    crd.cardprise.remove(62662);
                                    crd.cheacker=false;
                                    total-=62662;
                                    setState(() {

                                    });

                                  }, child: Text("Remove")) ,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HandbagsDetails()));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            height: 300,
                            child: Card(
                                elevation: 5,
                                child: Image.network("${image[2]}"))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("INOVERA Handbags",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15),),
                            Text("₹1,399",style: TextStyle(fontSize: 20),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:cheack2 ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count+=1;
                                    cheack2=false;
                                    crd.cardimage.add("${image[2]}");
                                    crd.cardname.add("INOVERA Handbags");
                                    crd.cardprise.add(1399);
                                    crd.cheacker=true;
                                    total+=1399;
                                    setState(() {
                                    });
                                  }, child: Text("Add")) : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){

                                    count-=1;
                                    cheack2=true;
                                    crd.cardimage.remove("${image[2]}");
                                    crd.cardname.remove("INOVERA Handbags");
                                    crd.cardprise.remove(1399);
                                    crd.cheacker=false;
                                    total-=1399;
                                    setState(() {

                                    });

                                  }, child: Text("Remove")) ,
                            )
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AppleDetails()));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            height: 300,
                            child: Card(
                                elevation: 5,
                                child: Image.network("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/711BW6zqs0L._SL1500_.jpg"))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Apple Watch Series 7",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 15),),
                            Text("₹44,900",style: TextStyle(fontSize: 20),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:cheack3 ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count+=1;
                                    cheack3=false;
                                    crd.cardimage.add("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/711BW6zqs0L._SL1500_.jpg");
                                    crd.cardname.add("Apple Watch Series 7");
                                    crd.cardprise.add(44900);
                                    crd.cheacker=true;
                                    total+=44900;
                                    setState(() {
                                    });
                                  }, child: Text("Add")) : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){

                                    count-=1;
                                    cheack3=true;
                                    crd.cardimage.remove("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/711BW6zqs0L._SL1500_.jpg");
                                    crd.cardname.remove("Apple Watch Series 7");
                                    crd.cardprise.remove(44900);
                                    crd.cheacker=false;
                                    total-=44900;
                                    setState(() {
                                    });
                                  }, child: Text("Remove")) ,
                            )
                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => OnePlusDetails()));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            height: 300,
                            child: Card(
                                elevation: 5,
                                child: Image.network("${image1[0]}"))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("OnePlus Nord Buds",style: TextStyle(fontSize: 15),),
                            Text("₹2,799",style: TextStyle(fontSize: 20),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:cheack4 ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count+=1;
                                    cheack4=false;
                                    crd.cardimage.add("${image1[0]}");
                                    crd.cardname.add("OnePlus Nord Buds");
                                    crd.cardprise.add(2799);
                                    crd.cheacker=true;
                                    total+=2799;

                                    setState(() {
                                    });
                                  }, child: Text("Add")) : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){

                                    count-=1;
                                    cheack4=true;
                                    crd.cardimage.remove("${image1[0]}");
                                    crd.cardname.remove("OnePlus Nord Buds");
                                    crd.cardprise.remove(2799);
                                    crd.cheacker=false;
                                    total-=2799;
                                    setState(() {

                                    });

                                  }, child: Text("Remove")) ,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => IPhoneDetails()));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            height: 300,
                            child: Card(
                                elevation: 5,
                                child: Image.network("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/31GmCJTD0GL._SY445_SX342_QL70_FMwebp_.jpg"))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Apple iPhone 14 Pro Max",style: TextStyle(fontSize: 15),),
                            Text("₹1,49,900",style: TextStyle(fontSize: 20),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:cheack5 ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count+=1;
                                    cheack5=false;
                                    crd.cardimage.add("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/31GmCJTD0GL._SY445_SX342_QL70_FMwebp_.jpg");
                                    crd.cardname.add("Apple iPhone 14 Pro Max");
                                    crd.cardprise.add(149900);
                                    crd.cheacker=true;
                                    total+=149900;

                                    setState(() {
                                    });
                                  }, child: Text("Add")) : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){

                                    count-=1;
                                    cheack5=true;
                                    crd.cardimage.remove("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/31GmCJTD0GL._SY445_SX342_QL70_FMwebp_.jpg");
                                    crd.cardname.remove("Apple iPhone 14 Pro Max");
                                    crd.cardprise.remove(149900);
                                    crd.cheacker=false;
                                    total-=149900;

                                    setState(() {

                                    });

                                  }, child: Text("Remove")) ,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => OnePlusMobileDetails()));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            height: 300,
                            child: Card(
                                elevation: 5,
                                child: Image.network("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/413u56t+CiL._SY300_SX300_.jpg"))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("OnePlus Nord CE 2 Lite 5G",style: TextStyle(fontSize: 15),),
                            Text("₹18,999",style: TextStyle(fontSize: 20),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:cheack6 ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count+=1;
                                    cheack6=false;
                                    crd.cardimage.add("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/413u56t+CiL._SY300_SX300_.jpg");
                                    crd.cardname.add("OnePlus Nord CE 2 Lite 5G");
                                    crd.cardprise.add(18999);
                                    crd.cheacker=true;
                                    total+=18999;
                                    setState(() {
                                    });
                                  }, child: Text("Add")) : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){

                                    count-=1;
                                    cheack6=true;
                                    crd.cardimage.remove("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/413u56t+CiL._SY300_SX300_.jpg");
                                    crd.cardname.remove("OnePlus Nord CE 2 Lite 5G");
                                    crd.cardprise.remove(18999);
                                    total-=18999;
                                    crd.cheacker=false;
                                    setState(() {

                                    });

                                  }, child: Text("Remove")) ,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => DellDetails()));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/5,
                    child: Row(
                      children: [
                        SizedBox(
                            width: 170,
                            height: 300,
                            child: Card(
                                elevation: 5,
                                child: Image.network("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/41Qs26lWmBL._SX300_SY300_QL70_FMwebp_.jpg"))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dell Inspiron 3520 Laptop",overflow : TextOverflow.ellipsis, maxLines:3,style: TextStyle(fontSize: 15),),
                            Text("₹57,490",style: TextStyle(fontSize: 20),),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:cheack7 ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){
                                    count+=1;
                                    cheack7=false;
                                    crd.cardimage.add("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/41Qs26lWmBL._SX300_SY300_QL70_FMwebp_.jpg");
                                    crd.cardname.add("Dell Inspiron 3520 Laptop");
                                    crd.cardprise.add(57490);
                                    total+=57490;
                                    crd.cheacker=true;
                                    setState(() {
                                    });
                                  }, child: Text("Add")) : ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                                  ),
                                  onPressed: (){

                                    count-=1;
                                    cheack7=true;

                                    crd.cardimage.remove("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/41Qs26lWmBL._SX300_SY300_QL70_FMwebp_.jpg");
                                    crd.cardname.remove("Dell Inspiron 3520 Laptop");
                                    crd.cardprise.remove(57490);
                                    crd.cheacker=false;
                                    total-=57490;
                                    setState(() {
                                    });
                                  }, child: Text("Remove")) ,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }




}
