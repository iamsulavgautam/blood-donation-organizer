import 'package:flutter/material.dart';
import '../widgets/floatingLogo.dart';
import '../widgets/loginFields.dart';
import '../widgets/loginButton.dart';
import 'homeScreen.dart'; // Adjust if needed

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _floatingAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatingController.dispose();
    super.dispose();
  }

  void handleLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: availableHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 40),
                      // Title
                      const Text(
                        "Rakta Login",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Floating Logo
                      FloatingLogo(animation: _floatingAnimation),

                      const SizedBox(height: 30),

                      // Login Fields
                      const LoginFields(),

                      const SizedBox(height: 40),

                      // Login Button
                      LoginButton(onTap: handleLogin),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
