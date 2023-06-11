import 'package:lista_telefonica/model/concato.dart';

class ContactoRepository {
  final List<ContactoModel> _contactos = [];

  List<ContactoModel> LoadContactos() {
    _contactos.clear();
    _contactos.addAll([
      ContactoModel(name: "José Paulo", phoneNumber: "+244923764519"),
      ContactoModel(name: "José Costa", phoneNumber: "+244924784519"),
      ContactoModel(name: "Paulo da Cunha", phoneNumber: "+244924784519"),
    ]);
    return _contactos;
  }

  List<ContactoModel> add(ContactoModel contactoModel) {
    _contactos.add(contactoModel);
    return _contactos;
  }

  List<ContactoModel> remove(ContactoModel contactoModel) {
    _contactos.remove(contactoModel);
    return _contactos;
  }

  List<ContactoModel> update(ContactoModel contactoModel) {
    _contactos.forEach((element) {
      if (element == contactoModel) {
        element.name = contactoModel.name;
        element.phoneNumber = contactoModel.phoneNumber;
      }
    });
    return _contactos;
  }
}
