import 'package:flutter/material.dart';

class GlassMorphWidget extends StatelessWidget {
  const GlassMorphWidget({super.key, required this.child, required this.color});

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: child,
          ),
        ),
      ),
    );
  }
}
