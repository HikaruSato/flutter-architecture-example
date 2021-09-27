import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}
