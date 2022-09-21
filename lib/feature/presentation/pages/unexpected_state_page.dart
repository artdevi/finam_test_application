import 'package:flutter/material.dart';

class UnexpectedStatePage extends StatelessWidget {
  const UnexpectedStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Unexpected state :(',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }
}
