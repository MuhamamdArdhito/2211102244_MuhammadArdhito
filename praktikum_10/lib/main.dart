import 'package:flutter/material.dart';
import 'sql_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQL Helper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _items = [];

  void refreshItems() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data SQLite")),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(_items[index]['title']),
            subtitle: Text(_items[index]['description']),
          ),
        ),
      ),
    );
  }
}
