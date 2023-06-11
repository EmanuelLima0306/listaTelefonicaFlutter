import 'package:lista_telefonica/bd/db.dart';
import 'package:lista_telefonica/model/concato.dart';

class ContactoRepository {
  final List<ContactoModel> _contactos = [];

  Future<List<ContactoModel>> LoadContactos() async {
    final db = await openDataBae();
    final contactos = await db.query("contactos");
    return contactos.map((e) => ContactoModel.fromJson(e)).toList();
  }

  Future<int> add(ContactoModel contactoModel) async {
    final db = await openDataBae();
    return db.insert("contactos", contactoModel.toJson());
  }

  Future<int> remove(ContactoModel contactoModel) async {
    final db = await openDataBae();
    return db.delete("contactos", where: "id=?", whereArgs: [contactoModel.id]);
  }

  Future<int> update(ContactoModel contactoModel) async {
    final db = await openDataBae();
    return db.update("contactos", contactoModel.toJson(),
        where: "id=?", whereArgs: [contactoModel.id]);
  }
}
