import 'package:json_annotation/json_annotation.dart';

import 'deckModel.dart';

part 'deckListModel.g.dart';

@JsonSerializable()
class DeckListModel {
  List<DeckModel> decks;
  DeckListModel(this.decks);

  factory DeckListModel.fromJson(Map<String, dynamic> json) =>
      _$DeckListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeckListModelToJson(this);
}
