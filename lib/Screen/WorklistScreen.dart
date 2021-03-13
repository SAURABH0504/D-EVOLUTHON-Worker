import 'package:flutter/material.dart';

class WorklistScreen extends StatefulWidget {
  @override
  _WorklistScreenState createState() => _WorklistScreenState();
}

class _WorklistScreenState extends State<WorklistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Work in your Area'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,

            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            child: const Center(child: Text('Entry C')),

          ),
        ],
      ),
    );
  }
}
