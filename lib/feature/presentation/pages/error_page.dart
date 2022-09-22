import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

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
            'Something went wrong :(',
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
