import 'package:json_annotation/json_annotation.dart';

part 'deckModel.g.dart';

@JsonSerializable()
class DeckModel {
  @JsonKey(name: "_id")
  String id;

  @JsonKey(name: "id_user")
  String userId;

  String name;

  DeckModel(this.id, this.userId, this.name);

  factory DeckModel.fromJson(Map<String, dynamic> json) =>
      _$DeckModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeckModelToJson(this);
}
