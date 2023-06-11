import 'package:flutter/material.dart';
import 'package:lista_telefonica/blocs/contactoBloc.dart';
import 'package:lista_telefonica/blocs/event/contactoEvet.dart';
import 'package:lista_telefonica/model/concato.dart';
import 'package:lista_telefonica/theme/Theme.dart';

class NewContacto extends StatelessWidget {
  final ContactoBloc contactoBloc;
  final ContactoModel? contactoModel;
  NewContacto({
    super.key,
    required this.contactoBloc,
    this.contactoModel,
  }) {
    if (contactoModel != null) {
      name.text = contactoModel!.name;
      phoneNumber.text = contactoModel!.phoneNumber;
    }
  }
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  clear() {
    name.text = "";
    phoneNumber.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.CardColor,
        iconTheme: IconThemeData(color: ThemeColor.primaryColor),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Container(
                  width: size.width * .2,
                  height: size.width * .2,
                  color: ThemeColor.primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Nome"),
              controller: name,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            TextField(
              decoration: const InputDecoration(hintText: "Nº Telefone"),
              controller: phoneNumber,
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: ElevatedButton.icon(
                  onPressed: () {
                    late ContactoEvent contactoEvent;
                    if (contactoModel == null) {
                      contactoEvent = AddContactoEvent(
                          contactoModel: ContactoModel(
                              name: name.text, phoneNumber: phoneNumber.text));
                    } else {
                      contactoModel!.name = name.text;
                      contactoModel!.phoneNumber = phoneNumber.text;
                      contactoEvent =
                          UpdateContactoEvent(contactoModel: contactoModel!);
                    }
                    contactoBloc.inputCotacto.add(contactoEvent);
                    clear();
                  },
                  icon: Icon(
                    Icons.check,
                    color: ThemeColor.CardColor,
                  ),
                  label: Text("Salvar")),
            )
          ],
        ),
      ),
    );
  }
}
