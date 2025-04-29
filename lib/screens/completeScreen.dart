import 'package:flutter/material.dart';
import './homeScreen.dart';
import '../utils/constants.dart';

class CompleteScreen extends StatelessWidget {
  const CompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/tick.png', width: 150),
                const SizedBox(height: 30),
                const Text('Request Successful!', style: AppStyles.heading),
                const SizedBox(height: 20),
                const Text(
                  'Our team will contact you shortly.',
                  style: AppStyles.normalText,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: AppButtonStyles.mainButton,
                  child: const Text('Go Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
