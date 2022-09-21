import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

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
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF192740).withOpacity(0.75),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            padding: const EdgeInsets.all(25),
            child: const CircularProgressIndicator(color: Color(0xFF0056FF)),
          ),
        ),
      ),
    );
  }
}
