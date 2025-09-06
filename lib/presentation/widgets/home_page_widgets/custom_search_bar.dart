import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/presentation/widgets/home_page_widgets/search_button.dart';

import 'articles_search_bar.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.onPressed,
    required this.dropDownButtonWidget,
  });

  final TextEditingController controller;
  final Function(String value) onSubmitted;
  final VoidCallback onPressed;
  final Widget dropDownButtonWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 14,
      children: [
        SizedBox(
          width: context.width * 0.5,
          height: context.height * 0.08,
          child: ArticlesSearchBar(
              controller: controller, onSubmitted: onSubmitted),
        ),
        SizedBox(width: 75, height: 60, child: dropDownButtonWidget),
        SearchButton(onPressed: onPressed)
      ],
    );
  }
}
