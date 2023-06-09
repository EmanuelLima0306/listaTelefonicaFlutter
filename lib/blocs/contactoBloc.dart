import 'dart:async';

import 'package:lista_telefonica/blocs/event/contactoEvet.dart';
import 'package:lista_telefonica/blocs/state/contactoState.dart';
import 'package:lista_telefonica/model/concato.dart';
import 'package:lista_telefonica/repository/contactoRepository.dart';

class ContactoBloc {
  final _contactoRepository = ContactoRepository();
  final StreamController<ContactoEvent> _inputContactoController =
      StreamController<ContactoEvent>();
  final StreamController<ContactoState> _outputContactoController =
      StreamController<ContactoState>();
  Sink<ContactoEvent> get inputCotacto => _inputContactoController.sink;
  Stream<ContactoState> get stream => _outputContactoController.stream;

  ContactoBloc() {
    _inputContactoController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ContactoEvent contactoEvent) {
    List<ContactoModel> contactos = [];

    if (contactoEvent is LoadContactoEvent) {
      contactos = _contactoRepository.LoadContactos();
    } else if (contactoEvent is AddContactoEvent) {
      contactos = _contactoRepository.add(contactoEvent.contactoModel);
    } else if (contactoEvent is RemoveContactoEvent) {
      contactos = _contactoRepository.remove(contactoEvent.contactoModel);
    }
  }
}