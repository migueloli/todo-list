import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoCreateBottomSheet extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final ValueChanged<String> onSave;

  TodoCreateBottomSheet({
    super.key,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add Todo',
            style: textStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            onSubmitted: onSave,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.pop();
              onSave(_controller.text);
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(textStyle),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
