import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SplaceScreen.dart';
import 'database_helper.dart';

// final dbHelper = DatabaseHelper();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the database
  // await dbHelper.initDB();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Myaap(),
  ));
}
class Myaap extends StatefulWidget {
  const Myaap({Key? key}) : super(key: key);
  @override
  State<Myaap> createState() => _MyaapState();
}
class _MyaapState extends State<Myaap> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplaceScreen(),
    );
  }
}
