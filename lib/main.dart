import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();
  final counter = prefs.getInt('counter') ?? 0;
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(counter),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Hello from build method');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Consumer<Counter>(
              builder: (context, counter, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Counter>(context, listen: false).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// rebuilds the whole widget:
//
//Text(
//     '${Provider.of<Counter>(context, listen: true).value}',
//      style: Theme.of(context).textTheme.headline4,
//  ),
