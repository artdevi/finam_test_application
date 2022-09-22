import 'package:flutter/material.dart';

class UnexpectedStatePage extends StatelessWidget {
  const UnexpectedStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF151C29),
              Color(0xFF08153F),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'Unexpected state :(',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFF0056FF),
            ),
          ),
        ),
      ),
    );
  }
}
