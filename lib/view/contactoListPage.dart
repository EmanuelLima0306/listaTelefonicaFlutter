import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lista_telefonica/blocs/contactoBloc.dart';
import 'package:lista_telefonica/blocs/event/contactoEvet.dart';
import 'package:lista_telefonica/blocs/state/contactoState.dart';
import 'package:lista_telefonica/theme/Theme.dart';

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
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, actions: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.grid_view_rounded,
                color: ThemeColor.primaryColor,
              ),
              Text(
                "Contactos",
                style: TextStyle(color: ThemeColor.titleColor),
              )
            ],
          ),
        )
      ]),
      body: StreamBuilder<ContactoState>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final contactosList = snapshot.data?.contactos ?? [];

            return Container(
              color: Colors.amber,
              child: ListView(
                children: [
                  ...contactosList.map((contacto) => Text(contacto.name))
                ],
              ),
            );
          }),
    );
  }
}
