import 'package:flutter/material.dart';
import 'package:testing_firestore2/students.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:ui' show lerpDouble;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // print("Something went wrong");
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print('first connection done');
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ListStudents(),
          );
        }
        return Text("Loading 1");

        // return CircularProgressIndicator();
      },
    );
  }
}
