import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final String title;
  final bool completed;
  final ValueChanged<bool> onChanged;

  const TodoListTile({
    super.key,
    required this.title,
    required this.completed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(width: 8);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () => onChanged(!completed),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 16,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: completed ? Colors.green : Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
            space,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: completed ? Colors.grey[600] : null,
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
            space,
            Icon(
              Icons.adaptive.arrow_forward,
              color: Colors.grey[500],
            ),
          ],
        ),
      ),
    );
  }
}
