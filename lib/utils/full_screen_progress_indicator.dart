import 'package:flutter/material.dart';

class FullScreenProgressIndicator extends StatelessWidget {
  const FullScreenProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
