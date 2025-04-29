import 'package:flutter/material.dart';
import 'actionScreen.dart'; // Import your ActionScreen normally

import '../widgets/floatingButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
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

  void navigateToActionScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ActionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Row(
                children: const [
                  Text(
                    'Hi, User ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text('👋', style: TextStyle(fontSize: 26)),
                ],
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.grey, thickness: 1),

              const SizedBox(height: 30),

              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat('200', 'Saved Life'),
                  Container(width: 1, height: 50, color: Colors.grey.shade300),
                  _buildStat('1250', 'Donors'),
                ],
              ),

              const SizedBox(height: 40),

              // Floating Button
              Expanded(
                child: Center(
                  child: FloatingButton(
                    animation: _floatingAnimation,
                    imagePath:
                        'assets/img/getBlood.png', // ✅ blood request button image
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActionScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        const Icon(Icons.bloodtype_outlined, size: 32, color: Colors.redAccent),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
