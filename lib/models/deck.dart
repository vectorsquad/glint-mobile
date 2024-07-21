part of 'models.dart';

@MappableClass()
class Deck with DeckMappable {
  @MappableField(key: "_id")
  String id;

  @MappableField(key: "id_user")
  String userId;

  String name;

  Deck(this.id, this.userId, this.name);
}
