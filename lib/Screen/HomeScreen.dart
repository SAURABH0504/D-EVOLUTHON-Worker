import 'package:flutter/material.dart';

import '../Service/AuthService.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search'),backgroundColor: Colors.green,),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text('Your Profile'),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
            ),
            ListTile(
              title:Text('Previous Transaction'),
              onTap: (){

              },
            ),
            ListTile(
              title:Text('Rating'),
              onTap: (){

              },
            ),
            ListTile(
              title:TextButton(child: Text('Logout',style: TextStyle(color: Colors.red),),onPressed: (){
                AuthService().signOut();
              },),
            ),

          ],
        ),
      ),
    );
  }
}
