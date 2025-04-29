import 'package:flutter/material.dart';
import '../widgets/floatingLogo.dart';
import './loginScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _floatingAnimation = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToLoginScreen() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // Title
              Center(
                child: Text(
                  "Rakta",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.redAccent.withOpacity(0.4),
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Floating logo (✅ Pass animation)
              Expanded(child: FloatingLogo(animation: _floatingAnimation)),

              const SizedBox(height: 20),

              // Subtitle
              Center(
                child: Text(
                  "Donate blood, save lives.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 40),

              // Save Life button
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: ElevatedButton(
                    onPressed: navigateToLoginScreen,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      elevation: 6,
                      shadowColor: Colors.redAccent.withOpacity(0.4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Save Life!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
