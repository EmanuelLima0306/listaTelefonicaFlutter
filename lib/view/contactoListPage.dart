import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lista_telefonica/blocs/contactoBloc.dart';
import 'package:lista_telefonica/blocs/event/contactoEvet.dart';
import 'package:lista_telefonica/blocs/state/contactoState.dart';
import 'package:lista_telefonica/theme/Theme.dart';
import 'package:lista_telefonica/view/item/contactoItem.dart';

class ContactoListPage extends StatefulWidget {
  const ContactoListPage({super.key});

  @override
  State<ContactoListPage> createState() => _ContactoListPageState();
}

class _ContactoListPageState extends State<ContactoListPage> {
  late final ContactoBloc bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = ContactoBloc();
    bloc.inputCotacto.add(LoadContactoEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.inputCotacto.close();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, actions: [
        Container(
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.grid_view_rounded,
                color: ThemeColor.primaryColor,
              ),
              Text(
                "Contactos",
                style: TextStyle(color: ThemeColor.titleColor, fontSize: 20),
              ),
              Icon(
                Icons.add,
                color: ThemeColor.primaryColor,
              )
            ],
          ),
        ),
      ]),
      body: StreamBuilder<ContactoState>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final contactosList = snapshot.data?.contactos ?? [];

            return Container(
              padding: const EdgeInsets.all(20),
              color: ThemeColor.CardColor,
              child: ListView(
                children: [
                  ...contactosList.map((contacto) => ContactoItem(
                        contactoModel: contacto,
                      ))
                ],
              ),
            );
          }),
    );
  }
}
