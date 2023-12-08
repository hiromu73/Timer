

import 'dart:async';

import 'package:flutter/material.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  int _hour = 0;
  int _min= 0;
  int _second = 0;

  bool _isRunning = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_hour'":"'$_second'":"'$_min',
              style: const TextStyle(fontSize: 48),
            ),
            ElevatedButton(onPressed: () {
              toggleTimer();
            },
              child: Text(_isRunning ? 'Stop' :"Start",
                style: TextStyle(color: _isRunning ? Colors.blue : Colors.green),),
            ),
          ],
        ),
      ),
    );
  }
  void toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(
        const Duration(milliseconds: 10),
            (timer) {
          setState(() {
            _min++;
          });
          if (_min == 100)
          {
            setState(() {
              _min = 0;
              _second++;
            });
          }
          if (_second == 60)
          {
            setState(() {
              _second = 0;
              _hour++;
            });
          }
        },

      );

    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void resetTimer () {
    _timer?.cancel();

    setState(() {
      _second = 0;
      _isRunning = false;
    });
  }
}

