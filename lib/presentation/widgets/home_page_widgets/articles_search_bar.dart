import 'package:flutter/material.dart';

class ArticlesSearchBar extends StatelessWidget {
  const ArticlesSearchBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final Function(String value) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textInputAction: TextInputAction.search,
      elevation: const WidgetStatePropertyAll(0),
      controller: controller,
      onSubmitted: onSubmitted,
    );
  }
}
