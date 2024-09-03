import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infcurion_plugin/infcurion_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infcurion App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Infcurion App Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 4),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(flex: 4),
            ElevatedButton(
              onPressed: launchSDK,
              child: const Text('launch SDK'),
            ),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: launchPlugin,
              child: const Text('launch Plugin'),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  static const platform = MethodChannel('com.example.infcurion_sdk/launch');

  void launchSDK() async => await platform.invokeMethod('launchSDK');
  // void launchPackage() async => Navigator.of(context)
  //     .push(MaterialPageRoute(builder: (_) => const WalletApp()));
  void launchPlugin() async {
    final infcurionPlugin = InfcurionPlugin();
    print("@@@ ${await infcurionPlugin.getPlatformVersion()}");
  }
}
