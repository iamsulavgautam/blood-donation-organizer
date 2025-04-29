import 'package:flutter/material.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildElevatedTextField(
          hintText: 'Enter your email',
          icon: Icons.email_outlined,
        ),
        const SizedBox(height: 20),
        _buildElevatedTextField(
          hintText: 'Enter your password',
          icon: Icons.lock_outline,
          isPassword: true,
        ),
      ],
    );
  }

  Widget _buildElevatedTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: -2,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Icon(icon, color: Colors.redAccent.withOpacity(0.7)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
