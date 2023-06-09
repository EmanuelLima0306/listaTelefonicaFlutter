import 'package:lista_telefonica/model/concato.dart';

abstract class ContactoState {
  List<ContactoModel> contactos;
  ContactoState({required this.contactos});
}

class ContactoStateInit extends ContactoState {
  ContactoStateInit() : super(contactos: []);
}

class ContactoSucessState extends ContactoState {
  List<ContactoModel> contactos;
  ContactoSucessState({required this.contactos}) : super(contactos: contactos);
}
