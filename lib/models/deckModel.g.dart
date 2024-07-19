// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deckModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckModel _$DeckModelFromJson(Map<String, dynamic> json) => DeckModel(
      json['_id'] as String,
      json['id_user'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$DeckModelToJson(DeckModel instance) => <String, dynamic>{
      '_id': instance.id,
      'id_user': instance.id_user,
      'name': instance.name,
    };
