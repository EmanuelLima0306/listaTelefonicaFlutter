import 'package:json_annotation/json_annotation.dart';

part 'concato.g.dart';

@JsonSerializable()
class ContactoModel {
  int? id;
  String? image;
  String? name;
  String? phoneNumber;
  ContactoModel({
    this.id,
    this.image,
    this.name,
    this.phoneNumber,
  });
  ContactoModel.empty();
  factory ContactoModel.fromJson(Map<String, dynamic> json) =>
      _$ContactoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactoModelToJson(this);
}
