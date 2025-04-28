import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _floatingController;
  late AnimationController _fieldsController;
  late Animation<double> _floatingAnimation;
  late Animation<double> _emailFieldAnimation;
  late Animation<double> _passwordFieldAnimation;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    // Floating Logo Controller
    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _floatingAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );

    // Fields Animation Controller
    _fieldsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _emailFieldAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _fieldsController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _passwordFieldAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _fieldsController,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    _buttonAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _fieldsController,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    _fieldsController.forward(); // Start form entrance animation once
  }

  @override
  void dispose() {
    _floatingController.dispose();
    _fieldsController.dispose();
    super.dispose();
  }

  void handleLogin() {
    // You can implement login logic here later
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
                      // Top section
                      Column(
                        children: [
                          SizedBox(
                            height: availableHeight * 0.06,
                          ), // 6% of screen height
                          // App Title
                          Center(
                            child: Text(
                              "Rakta Login",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                                letterSpacing: 2,
                                shadows: [
                                  Shadow(
                                    blurRadius: 12,
                                    color: Colors.redAccent.withOpacity(0.4),
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Middle section - Logo
                      SizedBox(
                        height: availableHeight * 0.28, // 28% of screen height
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _floatingAnimation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, -_floatingAnimation.value),
                                child: child,
                              );
                            },
                            child: Hero(
                              tag: 'raktaLogo',
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.redAccent.withOpacity(0.2),
                                      spreadRadius: 15,
                                      blurRadius: 30,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/img/rakta.png',
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Form section - Input fields
                      Column(
                        children: [
                          // Email Field Animation
                          AnimatedBuilder(
                            animation: _emailFieldAnimation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, _emailFieldAnimation.value),
                                child: Opacity(
                                  opacity:
                                      1 - (_emailFieldAnimation.value / 50),
                                  child: _buildElevatedTextField(
                                    hintText: 'Enter your email',
                                    icon: Icons.email_outlined,
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: availableHeight * 0.03,
                          ), // 3% of screen height
                          // Password Field Animation
                          AnimatedBuilder(
                            animation: _passwordFieldAnimation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                  0,
                                  _passwordFieldAnimation.value,
                                ),
                                child: Opacity(
                                  opacity:
                                      1 - (_passwordFieldAnimation.value / 50),
                                  child: _buildElevatedTextField(
                                    hintText: 'Enter your password',
                                    icon: Icons.lock_outline,
                                    isPassword: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      // Bottom section - Login button
                      Column(
                        children: [
                          // Button Animation
                          AnimatedBuilder(
                            animation: _buttonAnimation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(0, _buttonAnimation.value),
                                child: Opacity(
                                  opacity: 1 - (_buttonAnimation.value / 50),
                                  child: _buildElevatedButton(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: availableHeight * 0.06,
                          ), // 6% of screen height
                        ],
                      ),
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

  Widget _buildElevatedTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      height: 65, // Fixed height for consistency
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
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

  Widget _buildElevatedButton() {
    return Container(
      width: double.infinity, // Full width button
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
