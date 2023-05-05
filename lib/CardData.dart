import 'package:flutter/material.dart';
import 'package:mcaproject/IPhoneDetails.dart';
import 'package:mcaproject/ProductUI.dart' as pu;

import 'ProductUI.dart';


List<dynamic?> cardimage=[];
List<dynamic?> cardname=[];
List<dynamic?> cardprise=[];
bool cheacker=false;

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: pu.count>0 ? Iteam() : NotIteam(),
    );
  }
  Widget Iteam(){
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              itemCount: cardimage.length ?? 0,
              itemBuilder: (contex, index){
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
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
                                  child: Image.network("${cardimage[index]}"))),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${cardname[index]}",style: TextStyle(fontSize: 15),),
                              Text("₹${cardprise[index]}",style: TextStyle(fontSize: 20),),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child:cheack1 ? ElevatedButton(
                              //       style: ButtonStyle(
                              //         backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                              //       ),
                              //       onPressed: (){
                              //         count+=1;
                              //         cheack1=false;
                              //         setState(() {
                              //         });
                              //       }, child: Text("Add")) : ElevatedButton(
                              //       style: ButtonStyle(
                              //         backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                              //       ),
                              //       onPressed: (){
                              //
                              //         count-=1;
                              //         cheack1=true;
                              //         setState(() {
                              //
                              //         });
                              //
                              //       }, child: Text("Remove")) ,
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),

          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 5,top: 10),
                      child: Text("SubTotal",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10,bottom: 5),
                      child: Text("${pu.total}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                    ),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10,bottom: 5),
                      child: Text("Shipping & Handling",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 16)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10,bottom: 5),
                      child: Text("\$0.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                    ),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 5),
                      child: Text("Tax",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10,bottom: 5),
                      child: Text("\$0.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                    ),
                  ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 5),
                      child: Text("Discount",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10,bottom: 5),
                      child: Text("\$0.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                    ),
                  ],),
              ],
            ),
          ),

          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 5),
                  child: Text("SubTotal",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,bottom: 5),
                  child: Text("${pu.total}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
                ),
              ],),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Card(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ProductScreen()));

                },
                style: TextButton.styleFrom( //<-- SEE HERE
                  side: BorderSide(width: 3.0,),
                  fixedSize: Size(300, 50)
                ),
                child: Text('CONTINUE SHOPING',style: TextStyle(color: Colors.black,)),
              ),
            ),
          ),



        ],
      ),
    );
  }

  Widget NotIteam(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [


            SizedBox(
                width: MediaQuery.of(context).size.width/2.5,
                height: MediaQuery.of(context).size.height/3,
                child: Image.network("https://media.istockphoto.com/id/861576608/vector/empty-shopping-bag-icon-online-business-vector-icon-template.jpg?s=1024x1024&w=is&k=20&c=Ln8eH_a_HybWI2QWaEzVPjvPziNjD7Z0BL5_gee5Rg4=",)),
            Text("Empty",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("No Items in your cart",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.grey),),
            ),
            Text("Please add products in to cart",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.grey),),

            InkWell(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ProductScreen()));

              },
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  color: Colors.black,

                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height/14,

                  child: Center(child: Text("CONTINUE SHOPPING",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.white),)),
                ),
              ),
            )

,      ],

        ),
      ),
    );
  }

}


