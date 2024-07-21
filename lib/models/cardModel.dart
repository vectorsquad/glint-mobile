import 'package:json_annotation/json_annotation.dart';

part 'cardModel.g.dart';

@JsonSerializable()
class CardModel {
  @JsonKey(name: "_id")
  String id;

  String side_front;
  String side_back;
  String id_deck;
  int deck_index;

  CardModel(this.id, this.side_front, this.side_back, this.id_deck, this.deck_index);

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}