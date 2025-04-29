import 'package:flutter/material.dart';
import '../widgets/customDropdown.dart';
import '../widgets/floatingButton.dart';
import './completeScreen.dart';
import '../utils/constants.dart';
import '../utils/locationData.dart'; // ✅ Correct

class ActionScreen extends StatefulWidget {
  const ActionScreen({super.key});

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatingAnimation;

  String? selectedProvince;
  String? selectedDistrict;
  String? selectedMunicipality;
  String? selectedBloodGroup;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('Get Blood', style: AppStyles.heading),
              const SizedBox(height: 30),

              // Blood Group Dropdown
              CustomDropdown(
                title: 'Blood Group',
                items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'],
                selectedItem: selectedBloodGroup,
                onChanged: (value) {
                  setState(() {
                    selectedBloodGroup = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Province Dropdown
              CustomDropdown(
                title: 'Province',
                items: locationData.keys.toList(), // ✅ Corrected
                selectedItem: selectedProvince,
                onChanged: (value) {
                  setState(() {
                    selectedProvince = value;
                    selectedDistrict = null;
                    selectedMunicipality = null;
                  });
                },
              ),

              const SizedBox(height: 20),

              // District Dropdown
              CustomDropdown(
                title: 'District',
                items:
                    selectedProvince != null
                        ? locationData[selectedProvince!]!.keys.toList()
                        : [],
                selectedItem: selectedDistrict,
                onChanged: (value) {
                  setState(() {
                    selectedDistrict = value;
                    selectedMunicipality = null;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Municipality Dropdown
              CustomDropdown(
                title: 'Municipality',
                items:
                    selectedProvince != null && selectedDistrict != null
                        ? locationData[selectedProvince!]![selectedDistrict!]!
                        : [],
                selectedItem: selectedMunicipality,
                onChanged: (value) {
                  setState(() {
                    selectedMunicipality = value;
                  });
                },
              ),

              const SizedBox(height: 50),

              // Floating Request Button
              Center(
                child: FloatingButton(
                  animation: _floatingAnimation,
                  imagePath: 'assets/img/getBlood.png', // ✅ Correct image
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompleteScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
