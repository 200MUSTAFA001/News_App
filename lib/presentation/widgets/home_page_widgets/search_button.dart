import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: const Color(0xFF5474fd),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.search,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
