import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infcurion_lib/infcurion_lib.dart';
import 'package:infcurion_lib/screens/main.dart';

void main() {
  PlatformDispatcher.instance.onError = (error, _) {
    debugPrint('Error from App: $error');
    return true;
  };

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const Spacer(),
            const Text('on Click to launch Library'),
            const Spacer(),
            ElevatedButton(
              onPressed: () async => await raiseError(),
              child: const Text('raise Error'),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => launchWalletApp(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  raiseError() async {
    await Future.delayed(const Duration(seconds: 1));
    throw Exception('Error from App');
  }
}
