import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infcurion_lib/infcurion_lib.dart';
import 'package:infcurion_lib/screens/wallet_app_second.dart';

class WalletAppHome extends StatefulWidget {
  const WalletAppHome({super.key});

  @override
  State<WalletAppHome> createState() => _WalletAppHomeState();
}

class _WalletAppHomeState extends State<WalletAppHome> {
  @override
  void dispose() {
    PlatformDispatcher.instance.onError = originDispatchedOnError;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Library Home Page'),
      ),
      body: const Center(
        child: Text('Library Wallet App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const WalletAppSecond()));
        },
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
