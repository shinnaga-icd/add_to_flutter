import 'dart:async';

import 'package:flutter/material.dart';

class WalletAppSecond extends StatelessWidget {
  const WalletAppSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Library Second Page'),
      ),
      body: const Center(
        child: Text('Library Wallet App : 2'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await raiseError(),
        child: const Icon(Icons.error),
      ),
    );
  }

  Future<void> raiseError() async {
    await Future.delayed(const Duration(seconds: 1));
    throw Exception('Error from Library');
  }
}
