import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Button extends StatelessWidget {
  final String url;

  const Button(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFF0056FF)),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        onPressed: () async {
          await launchUrlString(url);
        },
        child: const Text('Open in Browser'),
      ),
    );
  }
}