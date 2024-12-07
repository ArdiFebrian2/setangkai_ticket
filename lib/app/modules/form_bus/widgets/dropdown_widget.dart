import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownWidget extends StatelessWidget {
  final String label;
  final List<String> items;
  final RxString selectedValue;
  final ValueChanged<String?> onChanged;

  const DropdownWidget({
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Obx(() {
          return DropdownButton<String>(
            value: selectedValue.value.isEmpty ? null : selectedValue.value,
            onChanged: (value) {
              selectedValue.value = value ?? ''; // Update the RxString value
              onChanged(value); // Call the onChanged callback
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
