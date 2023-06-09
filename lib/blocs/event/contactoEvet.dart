import 'package:lista_telefonica/model/concato.dart';

abstract class ContactoEvent {}

class LoadContactoEvent extends ContactoEvent {}

class AddContactoEvent extends ContactoEvent {
  ContactoModel contactoModel;
  AddContactoEvent({required this.contactoModel});
}

class RemoveContactoEvent extends ContactoEvent {
  ContactoModel contactoModel;
  RemoveContactoEvent({required this.contactoModel});
}
