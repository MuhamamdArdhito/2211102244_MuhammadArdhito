import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HelloWorldWidget(),
    RowWidget(),
    ColumnWidget(),
    NestedLayoutWidget(),
    CustomScrollViewWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widgets Demo')),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hello'),
          BottomNavigationBarItem(icon: Icon(Icons.view_column), label: 'Row'),
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: 'Column'),
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Nested'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ScrollView'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HelloWorldWidget extends StatelessWidget {
  const HelloWorldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Hello, world!', style: TextStyle(fontSize: 24));
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        FlutterLogo(),
        Expanded(
          child: Text("Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bugs faster."),
        ),
        Icon(Icons.sentiment_very_satisfied),
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const <Widget>[
        Text('We move under cover and we move as one'),
        Text('Through the night, we have one shot to live another day'),
        Text('We cannot let a stray gunshot give us away'),
      ],
    );
  }
}

class NestedLayoutWidget extends StatelessWidget {
  const NestedLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: const <Widget>[
            Icon(Icons.star, color: Colors.green),
            Icon(Icons.star, color: Colors.green),
            Icon(Icons.star, color: Colors.green),
          ],
        ),
        Column(
          children: const <Widget>[
            Icon(Icons.timer, color: Colors.blue),
            Text('COOK:'),
            Text('1 hr'),
          ],
        ),
      ],
    );
  }
}

class CustomScrollViewWidget extends StatelessWidget {
  const CustomScrollViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(title: Text('Demo')),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue[(index % 9) * 100],
                child: Text('List Item $index', style: const TextStyle(fontSize: 20)),
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
