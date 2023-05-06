import 'package:flutter/material.dart';

import 'ProductUI.dart';

List<dynamic>wishlst=[];
List<dynamic>wishname=[];
List<dynamic>wishprice=[];
class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: wishprice.length > 0 ? Wishlist() : NotIteam(),
    );
  }

  Widget Wishlist(){
    return Column(
      children: [
        ListView.builder(
            physics: PageScrollPhysics(),
            shrinkWrap: true,
            itemCount: wishlst.length ?? 0,
            itemBuilder: (contex, index) {
              return InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ProductScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Row(
                        children: [
                          SizedBox(
                              width: 170,
                              height: 300,
                              child: Card(
                                  elevation: 5,
                                  child: Image.network(
                                      "${wishlst[index]}"))),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${wishname[index]}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "₹${wishprice[index]}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),

      ],
    ) ;
  }
  Widget NotIteam() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(
                  "https://media.istockphoto.com/id/861576608/vector/empty-shopping-bag-icon-online-business-vector-icon-template.jpg?s=1024x1024&w=is&k=20&c=Ln8eH_a_HybWI2QWaEzVPjvPziNjD7Z0BL5_gee5Rg4=",
                )),
            Text(
              "Empty",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "No Items in your Wish List",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ),
            Text(
              "Please add products in to Wish List",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProductScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 14,
                  child: Center(
                      child: Text(
                        "CONTINUE SHOPPING",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
