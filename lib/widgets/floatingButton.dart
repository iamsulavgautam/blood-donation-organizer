import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final Animation<double> animation;
  final String imagePath;
  final VoidCallback onTap;

  const FloatingButton({
    super.key,
    required this.animation,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // ✅ MOVE GestureDetector outside
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -animation.value),
            child: child,
          );
        },
        child: Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [Colors.redAccent.withOpacity(0.25), Colors.transparent],
              center: Alignment.center,
              radius: 0.8,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent.withOpacity(0.3),
                blurRadius: 30,
                spreadRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
