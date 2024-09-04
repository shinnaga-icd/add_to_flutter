import 'package:flutter/material.dart';

class WalletAppHome extends StatelessWidget {
  const WalletAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Wallet App Home Page'),
      ),
      body: const Center(
        child: Text('Welcome to Wallet App'),
      ),
    );
  }
}
