import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lista_telefonica/theme/Theme.dart';

class MyIconIlustrate extends StatelessWidget {
  final double myWith;
  final double myHeight;
  MyIconIlustrate({
    super.key,
    required this.myWith,
    required this.myHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: myHeight,
      width: myWith,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(Icons.keyboard_double_arrow_left_outlined)
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .shimmer(delay: 1000.ms)
              .moveX(begin: 0, end: 1)
        ],
      ),
    );
  }
}
