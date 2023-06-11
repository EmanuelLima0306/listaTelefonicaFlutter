import 'dart:async';

import 'package:flutter/material.dart';
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

  _mapEventToState(ContactoEvent contactoEvent) async {
    List<ContactoModel> _contactos = [];
    if (contactoEvent is LoadContactoEvent) {
      _contactos = await _contactoRepository.LoadContactos();
    } else if (contactoEvent is AddContactoEvent) {
      if (await _contactoRepository.add(contactoEvent.contactoModel) != 0) {
        _contactos = await _contactoRepository.LoadContactos();
      }
    } else if (contactoEvent is RemoveContactoEvent) {
      if (await _contactoRepository.remove(contactoEvent.contactoModel) != 0) {
        _contactos = await _contactoRepository.LoadContactos();
      }
    } else if (contactoEvent is UpdateContactoEvent) {
      if (await _contactoRepository.update(contactoEvent.contactoModel) != 0) {
        _contactos = await _contactoRepository.LoadContactos();
      }
    }

    _outputContactoController.add(ContactoSucessState(contactos: _contactos));
  }
}
