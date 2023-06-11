import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TodoListTileShimmer extends StatelessWidget {
  const TodoListTileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox.square(
              dimension: 16,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 24,
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
