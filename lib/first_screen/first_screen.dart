import 'package:flutter/material.dart';
import 'package:hw_shrd_prfrncs/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late SharedPreferences _prefs;
  bool _wasShown = false;

  void initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _wasShown = _prefs.getBool('wasShown') ?? false;
    if (_wasShown) {
      Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          );
    }
  }

  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to my App'),
            const SizedBox(height: 24),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () {
                  _prefs.setBool('wasShown', true);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(),
                    ),
                  );
                },
                child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
