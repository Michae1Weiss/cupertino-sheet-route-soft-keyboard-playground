import 'package:flutter/material.dart';
import 'package:sheet/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => MaterialExtendedPageRoute(
        builder: (context) => const TestScreen(),
      ),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: _openModal,
              child: const Text('Open modal'),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: const TextField(autofocus: true),
            ),
          ],
        ),
      ),
    );
  }

  void _openModal() {
    Navigator.push(
      context,
      CupertinoSheetRoute<void>(
        builder: (context) {
          return ListView(
            children: [],
          );
        },
      ),
    );
  }
}