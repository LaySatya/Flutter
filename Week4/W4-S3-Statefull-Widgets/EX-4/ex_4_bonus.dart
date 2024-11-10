import 'package:flutter/material.dart';

enum Status {
  EXCELLENCE("Excellence"),
  GOOD("Good"),
  FAIR("Fair"),
  POOR("Poor");

  final String _status;
  const Status(this._status);

  @override
  String toString() => _status;
}

// stateful widget for score interaction
class ScoreCardInteraction extends StatefulWidget {
  final String _scoreTitle;
  const ScoreCardInteraction({super.key, required String scoreTitle}) : _scoreTitle = scoreTitle;

  @override
  State<ScoreCardInteraction> createState() => _ScoreCardInteractionState();
}

class _ScoreCardInteractionState extends State<ScoreCardInteraction> {
  int _score = 0;
  Color? _color;

  Status _getStatus() {
    if (_score <= 3) {
      return Status.POOR;
    } else if (_score > 3 && _score <= 6) {
      return Status.FAIR;
    } else if (_score > 6 && _score <= 9) {
      return Status.GOOD;
    } else {
      return Status.EXCELLENCE;
    }
  }

  Color? _getColor() {
    if (_score <= 3) {
      _color = Colors.green[200];
    } else if (_score > 3 && _score <= 6) {
      _color = Colors.green[400];
    } else if (_score > 6 && _score <= 9) {
      _color = Colors.green[600];
    } else {
      _color = Colors.green[800];
    }
    return _color;
  }

  void _addScore() {
    setState(() {
      if (_score < 10) {
        _score++;
      }
    });
  }

  void _minusScore() {
    setState(() {
      if (_score > 0) {
        _score--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          widget._scoreTitle,
          style: const TextStyle(fontSize: 25),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: _minusScore,
              tooltip: 'Minus',
            ),
            const SizedBox(width: 15),
            Text(
              '$_score',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 15),
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Add',
              onPressed: _addScore,
            )
          ],
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              width: 400,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.only(left: 25, right: 25, top: 5),
              width: (_score * 400) / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _getColor(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          _getStatus().toString(),
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}

// stateless widget for the score card container
class ScoreCard extends StatelessWidget {
  final String _title;
  const ScoreCard({super.key, required String title}) : _title = title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: ScoreCardInteraction(scoreTitle: _title),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        children: [
          ScoreCard(title: "My Score in Flutter"),
          ScoreCard(title: "My score in Dart"),
          ScoreCard(title: "My Score in React")
        ],
      ),
    ),
  ));
}
