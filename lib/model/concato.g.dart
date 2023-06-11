// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concato.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactoModel _$ContactoModelFromJson(Map<String, dynamic> json) =>
    ContactoModel(
      id: json['id'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$ContactoModelToJson(ContactoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };
