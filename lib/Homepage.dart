import 'package:flutter/material.dart';
import 'package:test3/history_page.dart';
import 'package:test3/play_page.dart';
import 'package:test3/winning_score.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool doubleBackToExitPressedOnce = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (doubleBackToExitPressedOnce) {
          return true;
        }
        doubleBackToExitPressedOnce = true;
        Future.delayed(Duration(seconds: 2), () {
          doubleBackToExitPressedOnce = false;
        });
        return false;
      },
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>WinningScorePage()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/play.png'),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'PLAY',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>HistoryPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/history.png'),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'HISTORY',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}