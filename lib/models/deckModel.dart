import 'package:json_annotation/json_annotation.dart';

part 'deckModel.g.dart';

@JsonSerializable()
class DeckModel {
  @JsonKey(name: "_id")
  String id;

  String id_user;
  String name;

  DeckModel(this.id, this.id_user, this.name);

  factory DeckModel.fromJson(Map<String, dynamic> json) =>
      _$DeckModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeckModelToJson(this);
}
