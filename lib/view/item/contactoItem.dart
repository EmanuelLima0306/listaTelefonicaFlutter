import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lista_telefonica/blocs/contactoBloc.dart';
import 'package:lista_telefonica/blocs/event/contactoEvet.dart';
import 'package:lista_telefonica/model/concato.dart';
import 'package:lista_telefonica/theme/Theme.dart';
import 'package:lista_telefonica/view/contactoNewPage.dart';
import 'package:lista_telefonica/view/item/buttons.dart';
import 'package:lista_telefonica/view/item/iconIlustrate.dart';

class ContactoItem extends StatefulWidget {
  final ContactoBloc bloc;
  final ContactoModel contactoModel;

  ContactoItem({super.key, required this.contactoModel, required this.bloc});

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
                    widget.contactoModel.name![0],
                    style: TextStyle(
                        color: ThemeColor.CardColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contactoModel.name!,
                    style: TextStyle(
                      color: ThemeColor.titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.contactoModel.phoneNumber!,
                    style: TextStyle(
                        color: ThemeColor.subtitleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            if (_showSecondElement)
              MyButtons(
                myWith: size.width * .4,
                myHeight: size.width * .1,
                ontapDelete: () => widget.bloc.inputCotacto.add(
                    RemoveContactoEvent(contactoModel: widget.contactoModel)),
                ontapEdite: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewContacto(
                          contactoBloc: widget.bloc,
                          contactoModel: widget.contactoModel,
                        ))),
              )
            else
              MyIconIlustrate(
                  myWith: size.width * .4, myHeight: size.width * .1)
          ],
        ),
      ),
    );
  }
}
