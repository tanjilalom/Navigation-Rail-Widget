import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.all,
            backgroundColor: Colors.deepPurple[100],
            groupAlignment: 0, //Top, Middle, Bottom
            onDestinationSelected: (val){
              setState(() {
                _selectedIndex = val;
              });
            },
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text("Home"),
                selectedIcon: Icon(
                  Icons.home_outlined,
                  color: Colors.blueAccent,
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text("Person"),
                selectedIcon: Icon(
                  Icons.person_2_outlined,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}