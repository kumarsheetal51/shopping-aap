

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'WishList.dart' as ws;
import 'SuccessfullOrder.dart';

bool cheacker=true;
class OnePlusDetails extends StatefulWidget {
  const OnePlusDetails({Key? key}) : super(key: key);

  @override
  State<OnePlusDetails> createState() => _OnePlusDetailsState();
}

class _OnePlusDetailsState extends State<OnePlusDetails> {
  List<dynamic> image = [
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/514NPRZ1AQL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/51ws0E8cnbL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/51gX3E0vzjL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/41-vUVwh5VL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/41ky2aAa8hL.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/51RCojp+lAL.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/51h7IIZtgbL.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/41Ueth2Z3KL.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/41ZTdrl5NeL.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71rshYfbX7L._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/51PDeyFzo1L._SL1500_.jpg"
  ];
  int? controller;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("OnePlus Nord Buds")),
        actions: <Widget>[
          Stack(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: IconButton(
              //     icon: Icon(
              //       Icons.shopping_cart,
              //       color: Colors.white,
              //     ),
              //     onPressed: () {
              //       // do something
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 16),
              //   child: Text("${count ?? ""}",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              // ),
            ],

          ),
        ],
      ),
      body:

      Stack(

        children: [

          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 300,
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: image.length,
                      onPageChanged: (int page) {
                        setState(() {
                          controller = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return SizedBox(
                            height: 400,
                            width: 400,
                            child: Card(
                                elevation: 9,
                                child: Image.network("${image[index]}")));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: dots(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100, top: 12),
                  child: Text(
                    "OnePlus Nord Buds",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100, top: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Price : ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "₹2,799",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250, top: 5),
                  child: Text(
                    "IN STOCK",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 250, top: 15),
                  child: Text(
                    "QUANTITY",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (count == 1) {
                            setState(() {
                              count = 1;
                            });
                          } else {
                            setState(() {
                              count -= 1;
                            });
                          }
                        },
                        child: Container(
                          width: 80,
                          height: 50,
                          color: Colors.black,
                          child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      Text(
                        "${count}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            count += 1;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 50,
                          color: Colors.black,
                          child: Center(
                              child: Text("+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                    ],
                  ),
                ),




                Container(
                  height: MediaQuery.of(context).size.height/8,

                ),

              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height/10,
                child: Card(
                  child: Row(
                    children: [
                      cheacker ? InkWell(
                        onTap: () {
                          ws.wishlst.add("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/514NPRZ1AQL._SL1500_.jpg");
                          ws.wishprice.add(2799);
                          ws.wishname.add("OnePlus Nord Buds");
                          cheacker = false;
                          setState(() {
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2.1,
                          child: Center(child: Text("ADD TO WISH LIST")),
                        ),
                      ) : InkWell(
                        onTap: () {
                          ws.wishlst.remove("https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/514NPRZ1AQL._SL1500_.jpg");
                          ws.wishprice.remove(2799);
                          ws.wishname.remove("OnePlus Nord Buds");
                          cheacker = true;
                          setState(() {
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2.1,
                          child: Center(child: Text("REMOVE TO WISH LIST")),
                        ),
                      ),


                      InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => SuccessFullOrder()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2,
                          color: Colors.black,
                          child: Center(child: Text("BUY NOW",style: TextStyle(color: Colors.white),)),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),

    );
  }

  Widget dots() {
    return AnimatedSmoothIndicator(
      activeIndex: controller ?? 0,
      count: image.length,
      effect: WormEffect(),
    );
  }
}
