import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'data/functions/connection_check.dart';
import 'presentation/screens/home_page/home_page.dart';
import 'presentation/screens/no_connection_page/no_connection_page.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key, required this.mode});
  final RxBool mode;

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  @override
  void initState() {
    super.initState();
    isConnectionChecked();
  }

  Future<void> isConnectionChecked() async {
    final isConnected = await connectionCheck();

    if (!mounted) return;

    if (isConnected) {
      return Get.offAll(() => HomePage(mode: widget.mode));
    } else {
      return Get.offAll(() => NoConnectionPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/loading_animation.json",
          repeat: true,
        ),
      ),
    );
  }
}
