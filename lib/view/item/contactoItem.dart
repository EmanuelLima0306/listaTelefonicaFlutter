import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lista_telefonica/model/concato.dart';
import 'package:lista_telefonica/theme/Theme.dart';
import 'package:lista_telefonica/view/item/buttons.dart';
import 'package:lista_telefonica/view/item/iconIlustrate.dart';

class ContactoItem extends StatefulWidget {
  ContactoModel contactoModel;
  ContactoItem({super.key, required this.contactoModel});

  @override
  State<ContactoItem> createState() => _ContactoItemState();
}

class _ContactoItemState extends State<ContactoItem> {
  bool _showSecondElement = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragStart: (details) {
        _showSecondElement = false;
      },
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < 0) {
          setState(() {
            _showSecondElement = true;
            print(_showSecondElement);
          });
        } else if (details.delta.dx > 0) {
          setState(() {
            _showSecondElement = false;
            print(_showSecondElement);
          });
        }
      },
      child: Container(
        width: size.width,
        color: ThemeColor.CardColor,
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  color: ThemeColor.primaryColor,
                  child: Text(
                    widget.contactoModel.name[0],
                    style: TextStyle(color: ThemeColor.CardColor),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contactoModel.name,
                    style: TextStyle(
                      color: ThemeColor.titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.contactoModel.phoneNumber,
                    style: TextStyle(
                        color: ThemeColor.subtitleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            if (_showSecondElement)
              MyButtons(myWith: size.width * .4, myHeight: size.width * .1)
            else
              MyIconIlustrate(
                  myWith: size.width * .4, myHeight: size.width * .1)
          ],
        ),
      ),
    );
  }
}
