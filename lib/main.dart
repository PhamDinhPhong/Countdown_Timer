import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountdownScreen(),
    );
  }
}

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int _durationInSeconds = 0;
  int _endTime = DateTime.now().millisecondsSinceEpoch;
  bool _isCountingDown = false;

  void _startCountdown() {
    setState(() {
      _endTime = DateTime.now().millisecondsSinceEpoch + _durationInSeconds * 60 * 1000;
      _isCountingDown = true;
    });
  }

  void _restartCountdown() {
    setState(() {
      _endTime = DateTime.now().millisecondsSinceEpoch + _durationInSeconds * 60 * 1000;
      _isCountingDown = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _durationInSeconds = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Nhập số phút',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isCountingDown ? null : _startCountdown,
                child: Text('Bắt đầu đếm ngược'),
              ),
              SizedBox(height: 20),
              _durationInSeconds > 0
                  ? CountdownTimer(
                endTime: _endTime,
                textStyle: TextStyle(fontSize: 48),
              )
                  : Container(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _restartCountdown,
                child: Text('Restart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
