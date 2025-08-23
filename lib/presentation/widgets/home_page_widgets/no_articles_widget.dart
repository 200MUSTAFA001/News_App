import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoArticlesWidget extends StatelessWidget {
  const NoArticlesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Text(
          "you reached the limit \n come after 15 mins ",
          style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
