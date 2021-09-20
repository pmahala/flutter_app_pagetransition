import 'package:flutter/material.dart';
import 'package:flutter_app_pagetransition/SecondScreen.dart';
import 'package:lottie/lottie.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  toSecondScreen(context);
                },
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 50,
                  child: Center(
                    child: Text(
                      'To Screen 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 150),
                firstChild: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      first = !first;
                    });
                  },
                  child: Text(
                    'Test Button Animation',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                secondChild: Lottie.asset('assets/checkmark.json',
                    width: 40, repeat: false),
                crossFadeState: first
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              )
            ],
          ),
        ),
      ),
    );
  }
}

void toSecondScreen(BuildContext context) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) {
        return SecondScreen();
      },
      transitionsBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position:
              animation1.drive(Tween(begin: Offset(1, 1), end: Offset(0, 0))),
          child: ScaleTransition(
            scale: animation1,
            child: RotationTransition(
              turns: animation1.drive(
                Tween(begin: 0.0, end: 1.0).chain(
                  CurveTween(curve: Curves.fastOutSlowIn),
                ),
              ),
              child: child,
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 750),
    ),
  );
}
