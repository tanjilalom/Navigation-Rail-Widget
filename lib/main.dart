import 'package:flutter/material.dart';
import 'package:navigation_rail/page1.dart';
import 'package:navigation_rail/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final _pages = [
    page1(),
    page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.all,
              backgroundColor: Colors.deepPurple[100],
              elevation: 20,
              onDestinationSelected: (val) {
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
            Expanded(child: Container(
              child: _pages[_selectedIndex],
            ),),
          ],
        ),
      ),
    );
  }
}
