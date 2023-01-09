import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train/main.dart';
import 'package:train/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController valueController = TextEditingController();
  double m = 1000;
  double value = 0;
  double result = 0;
  bool Color = true;

  void Converting() {
    if (Color == true) {
      setState(() {
        value = double.parse(valueController.text);
        result = value / m;
      });
    } else {
      setState(() {
        value = double.parse(valueController.text);
        result = value * m;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeelangyang',
            style: TextStyle(color: Theme.of(context).accentColor)),
        actions: [
          IconButton(
              onPressed: () {
                currentTheme.toggleTheme();
              },
              icon: Icon(Icons.brightness_4_rounded)),
        ],
      ),
      body: Center(
        child: Container(
          width: w * 0.9,
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: valueController,
                decoration: InputDecoration(hintText: 'Enter input here'),
                style: TextStyle(
                    fontSize: 22, color: Theme.of(context).accentColor),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              Color = true;
                              value = 0;
                              result = 0;
                            });
                          },
                          icon: Icon(
                            Icons.album,
                            color: Color == true ? Colors.red : Colors.blueGrey,
                          ),
                        ),
                        Text(
                          'Meter to Kilometer',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              Color = false;
                              value = 0;
                              result = 0;
                            });
                          },
                          icon: Icon(
                            Icons.album,
                            color:
                                Color == false ? Colors.red : Colors.blueGrey,
                          ),
                        ),
                        Text(
                          'Kilometer to Meter',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Converting();
                      valueController.clear();
                    });
                  },
                  child: Text('Convert')),
              // Container(
              //   child: ElevatedButton(
              //       onPressed: () => context.read<AppData>().increment(),
              //       child: Text('${context.watch<AppData>().count}')),
              // ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Color == false
                    ? Text(
                        '$value km = $result m',
                        style: TextStyle(fontSize: 26),
                      )
                    : Text(
                        '$value m = $result km',
                        style: TextStyle(fontSize: 26),
                      ),
              ),
              // Show()
            ],
          ),
        ),
      ),
    );
  }
}
