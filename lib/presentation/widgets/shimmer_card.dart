import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(top: 18, bottom: 18),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        border: Border.all(
            color: Colors.transparent, width: 2, style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/images/placeholder.png"),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 50,
            width: context.width * 0.8,
            child: const Text(
              "shimmer card shimmer card shimmer card",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: context.height * 0.07,
            width: context.width * 0.9,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Icon(Icons.error_outline_outlined),
              ),
              title: const Text(
                "shimmer card",
              ),
              subtitle: const Text("date date date"),
              trailing: FloatingActionButton(
                heroTag: null,
                elevation: 0,
                onPressed: () {},
                child: const Icon(Icons.bookmark_border),
              ),
            ),
          )
        ],
      ),
    );
  }
}
