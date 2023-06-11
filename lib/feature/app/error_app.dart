import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorApp extends StatelessWidget {
  final FlutterErrorDetails details;
  const ErrorApp({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Something went wrong, do you wanna go back to the previous screen?',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () =>
                    context.canPop() ? context.pop() : context.replace('/'),
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 20),
                  ),
                ),
                child: const Text('Go back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
