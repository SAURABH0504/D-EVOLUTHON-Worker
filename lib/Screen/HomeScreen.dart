import 'package:flutter/material.dart';

import '../Service/AuthService.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool farmchecklistValue = false;
  bool plumberchecklistValue = false;
  bool electricianchecklistValue = false;
  bool rajmistrychecklistValue = false;
  String dropdownValue = 'Awadhpuri';
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
      body: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Select Location'
              ),
              Center(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Awadhpuri', 'MpNagar', 'Govindpura', 'Lalghati']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

                ),
              ),
            ],
          ),
          Text(
            'Select type of Work'
          ),
          CheckboxListTile(
               title: Text('Farmworker'),
              subtitle: Text('Work as Agriculture farm worker'),
              value: farmchecklistValue,
              onChanged: (value){
                 setState(() {
                   farmchecklistValue=value;
                 });
              }
          ),
          CheckboxListTile(
              title: Text('Raj Mistry'),
              subtitle: Text('Work as Bricklayer, painter.'),
              value: rajmistrychecklistValue,
              onChanged: (value){
                setState(() {
                  rajmistrychecklistValue=value;
                });
              }
          ),
          CheckboxListTile(
              title: Text('Electrician'),
              subtitle: Text('Wire cables, fix appliances'),
              value: electricianchecklistValue,
              onChanged: (value){
                setState(() {
                  electricianchecklistValue=value;
                });
              }
          ),
          CheckboxListTile(
              title: Text('Plumber'),
              subtitle: Text('Repair pipes and faucets'),
              value: plumberchecklistValue,
              onChanged: (value){
                setState(() {
                  plumberchecklistValue=value;
                });
              }
          ),
          Center(
            child: TextButton(onPressed:(){
              Navigator.pushNamed(context, '/WorklistScreen');
            } , child: Text(
              'Search',
            ),),
          )
        ],
      ),
    );
  }
}
