import 'package:flutter/material.dart';

enum TheBestRonanSubject {
  flutter('Flutter'),
  dart('Dart'),
  react('React');

  final String title;

  const TheBestRonanSubject(this.title);
}

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.lightGreen,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ScoreBar(subject: TheBestRonanSubject.flutter),
        ScoreBar(subject: TheBestRonanSubject.dart),
        ScoreBar(subject: TheBestRonanSubject.react),
      ],
    ),
  ),
));

class ScoreBar extends StatefulWidget {
  final TheBestRonanSubject subject;

  const ScoreBar({
    super.key,
    required this.subject
  });

  @override
  State<ScoreBar> createState() => _ScoreBarState();
}

class _ScoreBarState extends State<ScoreBar> {
  int currentScore = 0;
  int get availableBar => 10 - currentScore;

  Color getBarColor() {
    switch (currentScore) {
      case 1:
        return Colors.green[50]!;
      case 2:
        return Colors.green[100]!;
      case 3:
        return Colors.green[200]!;
      case 4:
        return Colors.green[300]!;
      case 5:
        return Colors.green[400]!;
      case 6:
        return Colors.green[500]!;
      case 7:
        return Colors.green[600]!;
      case 8:
        return Colors.green[700]!;
      case 9:
        return Colors.green[800]!;
      case 10:
        return Colors.green[900]!;
    }

    return Colors.transparent;
  }
  
  void addScore() {
    setState(() {
      currentScore += 1;
      if (currentScore > 10) currentScore = 10;
    });
  }

  void minusScore() {
    setState(() {
      currentScore -= 1;
      if (currentScore < 0) currentScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.only(left: 40, right: 40),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('My Score in ${widget.subject.title}', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: minusScore, icon: Icon(Icons.remove, size: 18)),
              IconButton(onPressed: addScore, icon: Icon(Icons.add, size: 18))
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 40), 
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: [
                Expanded(flex: currentScore, child: Container(decoration: BoxDecoration(color: getBarColor(), borderRadius: BorderRadius.circular(7)))),
                Expanded(flex: availableBar, child: SizedBox())
              ],
            ),
          )
        ],
      ),
    );
  }
}