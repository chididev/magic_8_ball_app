import 'package:flutter/material.dart';
import 'dart:math';

//The main function uis the starting point of our app.
void main() {
  runApp(const MagicBallApp());
}

//The stateless widget would contain the static design of our app.
class MagicBallApp extends StatelessWidget {
  const MagicBallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          leading: const Icon(
            Icons.games_outlined,
            size: 30.0,
            color: Colors.white,
          ),
          title: const Center(
            child: Text(
              'Magic 8 Ball App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        body: const BallPage(),
      ),
    );
  }
}

//The stateful widget would contain the dynamic part of our app.
//The text button would be able to change the images randomly on click.
class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  //The ballNumber variable holds the initial ball number.
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    //The ballNumber variable is randomly updated.
    ballNumber = Random().nextInt(5) + 1;
    //The magicBallPlay function calls the setState and rebuilds the
    //app with the updated magic ball on click.
    magicBallPlay() {
      setState(() {
        ballNumber;
      });
    }
    return Column(
      children: [
        Expanded(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/ball$ballNumber.png'),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              primary: Colors.black,
            ),
            onPressed: () {
              magicBallPlay();
            },
            child:const Text(
              'Click to Play',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
