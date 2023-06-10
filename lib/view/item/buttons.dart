import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lista_telefonica/model/concato.dart';
import 'package:lista_telefonica/theme/Theme.dart';

class MyButtons extends StatelessWidget {
  final double myWith;
  final double myHeight;
  final Function? ontapDelete;
  final Function? ontapEdite;
  MyButtons({
    super.key,
    required this.myWith,
    required this.myHeight,
    this.ontapDelete,
    this.ontapEdite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: myHeight,
      width: myWith,
      decoration: BoxDecoration(
          color: ThemeColor.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton.icon(
            style:
                ElevatedButton.styleFrom(backgroundColor: ThemeColor.CardColor),
            onPressed: () => ontapEdite,
            icon: Icon(
              Icons.edit,
              color: ThemeColor.titleColor,
              size: 20,
            ),
            label: const Text(""),
          ),
          ElevatedButton.icon(
            style:
                ElevatedButton.styleFrom(backgroundColor: ThemeColor.CardColor),
            onPressed: () => ontapEdite,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 20,
            ),
            label: const Text(""),
          )
        ],
      ),
    ).animate().scaleX();
  }
}
