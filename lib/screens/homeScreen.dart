import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hi User Text
              const Text(
                "Hi, User 👋",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),

              const SizedBox(height: 10), // Small gap before divider
              // Horizontal Line Divider
              Divider(thickness: 1, color: Colors.grey[300]),

              const SizedBox(height: 40), // More breathing after divider
              // Saved Life & Donors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Saved Life', '200'),
                  Container(width: 1, height: 50, color: Colors.grey[300]),
                  _buildStatCard('Donors', '1250'),
                ],
              ),

              const SizedBox(height: 70), // More breathing before the Logo
              // Centered Get Blood Logo as Button
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Action for Get Blood
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Get Blood button tapped! 🚑"),
                        ),
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
                      child: Image.asset(
                        'assets/img/getBlood.png', // Your sick logo path
                        fit: BoxFit.contain,
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

  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Icon(Icons.bloodtype_outlined, size: 40, color: Colors.redAccent),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
