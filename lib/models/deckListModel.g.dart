// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deckListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckListModel _$DeckListModelFromJson(Map<String, dynamic> json) =>
    DeckListModel(
      (json['decks'] as List<dynamic>)
          .map((e) => DeckModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeckListModelToJson(DeckListModel instance) =>
    <String, dynamic>{
      'decks': instance.decks,
    };
