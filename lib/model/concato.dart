class ContactoModel {
  String? image;
  String name;
  String phoneNumber;
  ContactoModel({
    required this.name,
    required this.phoneNumber,
    this.image,
  });
}
