import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<String> items = ['ar', 'en', 'fr', 'ru', 'es', 'zh'];
  final String? currentItem;
  final ValueChanged<String> onChanged;

  CustomDropDownButton({
    super.key,
    required this.currentItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.theme.primaryColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const Icon(Icons.language_sharp),
          value: currentItem,
          isExpanded: true,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(fontSize: 16)),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
        ),
      ),
    );
  }
}
