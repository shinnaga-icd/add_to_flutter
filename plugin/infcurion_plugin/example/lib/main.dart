import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:infcurion_plugin/infcurion_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _infcurionPlugin = InfcurionPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _infcurionPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            const Spacer(flex: 1),
            Text('Running on: $_platformVersion\n'),
            const Spacer(flex: 1),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _infcurionPlugin.launchWalletApp();
                } on PlatformException catch (e) {
                  print('Failed to launch wallet app: ${e.message}');
                }
              },
              child: const Text('Launch Wallet App'),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
