

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppleDetails extends StatefulWidget {
  const AppleDetails({Key? key}) : super(key: key);

  @override
  State<AppleDetails> createState() => _AppleDetailsState();
}

class _AppleDetailsState extends State<AppleDetails> {
  List<dynamic> image = [
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/711BW6zqs0L._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/811YNS1fzxL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/A1UIeoRxAhL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71mbpEXc+FL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/81sycKUzirL._SL1500_.jpg",
    "https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/612RFK9-VgL._SL1500_.jpg"
  ];
  int? controller;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Apple Watch Series 7")),
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
                    "Apple Watch Series 7",
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
                        "₹44,900",
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
                          if (count == 0) {
                            setState(() {
                              count = 0;
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            count += 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/2.1,
                          child: Center(child: Text("ADD TO CART")),
                        ),
                      ),
                      InkWell(
                        onTap: (){
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
