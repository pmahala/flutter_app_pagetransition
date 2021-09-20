import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                '/first',
              );
            },
            child: Container(
              color: Colors.blue,
              width: 200,
              height: 50,
              child: Center(
                child: Text(
                  'To Screen 1',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
