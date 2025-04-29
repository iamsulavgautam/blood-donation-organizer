import 'package:flutter/material.dart';

class FloatingLogo extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback? onTap; // ✅ add optional onTap

  const FloatingLogo({super.key, required this.animation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // ✅ allow tap
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
            boxShadow: [
              BoxShadow(
                color: Colors.redAccent.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/img/rakta.png', // logo image
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
