import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? selectedItem; // ✅ Add this line
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.items,
    this.selectedItem, // ✅ Add this
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedItem, // ✅ Add selectedItem here
              hint: Text(
                'Select $title',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.redAccent,
              ),
              isExpanded: true,
              items:
                  items.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
