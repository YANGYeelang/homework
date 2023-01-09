import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train/home_screen.dart';
import 'package:train/themes.dart';

// import 'package:train/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppData()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yeelang',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: HomeScreen(),
    );
  }
}

class AppData with ChangeNotifier {
  String _name = 'Yeelang';
  int _count = 0;

  String get name => _name;
  void changeData(String data) {
    _name = data;
    notifyListeners();
  }

  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}
