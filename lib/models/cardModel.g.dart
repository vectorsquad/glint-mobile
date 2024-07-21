// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      json['_id'] as String,
      json['side_front'] as String,
      json['side_back'] as String,
      json['id_deck'] as String,
      (json['deck_index'] as num).toInt(),
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      '_id': instance.id,
      'side_front': instance.side_front,
      'side_back': instance.side_back,
      'id_deck': instance.id_deck,
      'deck_index': instance.deck_index,
    };
