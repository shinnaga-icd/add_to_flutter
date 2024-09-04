library infcurion_lib;

import 'package:flutter/material.dart';
import 'package:infcurion_lib/screens/wallet_app_home.dart';

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const WalletAppHome(),
    );
  }
}
