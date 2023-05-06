import 'package:flutter/material.dart';

import 'ProductUI.dart';
import 'ProductUI.dart'as pu;
class SuccessFullOrder extends StatefulWidget {
  const SuccessFullOrder({Key? key}) : super(key: key);

  @override
  State<SuccessFullOrder> createState() => _SuccessFullOrderState();
}

class _SuccessFullOrderState extends State<SuccessFullOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height/5,
              width: MediaQuery.of(context).size.width,
              child: Image.network("https://www.primehairdepot.com/images/order_success_placed.gif",fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Card(
              child: TextButton(
                onPressed: () {
                  cheack=true;
                  cheack1=true;
                  cheack2=true;
                  cheack3=true;
                  cheack4=true;
                  cheack5=true;
                  cheack6=true;
                  cheack7=true;
                  cheack8=true;

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => ProductScreen()));
                },
                style: TextButton.styleFrom(
                  //<-- SEE HERE
                    side: BorderSide(
                      width: 3.0,
                    ),
                    fixedSize: Size(300, 50)),
                child: Text('CONTINUE SHOPING',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
