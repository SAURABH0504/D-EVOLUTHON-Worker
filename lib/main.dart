import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freelance_worker/Service/AuthService.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Screen/HomeScreen.dart';
import 'Screen/LoginSignUp.dart';
import 'Screen/ProfileScreen.dart';

void main() {
  runApp(new MaterialApp(
      routes: {
          '/HomeScreen': (context) => HomeScreen(),
          '/LoginSignUp': (context) => LoginSignUp(),
          '/ProfileScreen': (context) => ProfileScreen(),
        },
      debugShowCheckedModeBanner: false,
home:
  MyApp(),
),
);
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context,snapshot){
            if(snapshot.hasError)
            {
              return Center(child: Text('Error'),);
            }
            if(snapshot.connectionState==ConnectionState.done)
            {
              return AuthService().handleAuth();
            }
            return Container();
          }
      ),
      title: Text('Freelance Worker',style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.bold,fontSize: 25),),
      backgroundColor: Colors.white,
      loaderColor: Colors.green,
      useLoader: true,
    );
  }
}



