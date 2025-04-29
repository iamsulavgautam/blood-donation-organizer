import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Colors.white;
  static const Color primary = Colors.redAccent;
}

class AppStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle normalText = TextStyle(
    fontSize: 18,
    color: Colors.black87,
  );
}

class AppButtonStyles {
  static final ButtonStyle mainButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
    minimumSize: const Size(double.infinity, 60),
    padding: const EdgeInsets.symmetric(vertical: 18),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 0,
  );
}
