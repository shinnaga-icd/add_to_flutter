library infcurion_lib;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infcurion_lib/screens/wallet_app_home.dart';

bool Function(Object, StackTrace)? originDispatchedOnError;

launchWalletApp(BuildContext context) {
  originDispatchedOnError = PlatformDispatcher.instance.onError;
  try {
    PlatformDispatcher.instance.onError = (error, _) {
      debugPrint('Error from Library: $error');
      return true;
    };

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            debugPrint('PopScope: $didPop');
            if (didPop) return;
            Navigator.of(context).pop();
          },
          child: MaterialApp(
            title: 'Wallet App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
              useMaterial3: false,
            ),
            home: const WalletAppHome(),
          ),
        ),
      ),
    );
  } catch (e) {
    debugPrint('Error from Library: $e');
    PlatformDispatcher.instance.onError = originDispatchedOnError;
  }
}
