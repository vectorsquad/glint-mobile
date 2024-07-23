part of 'models.dart';

@MappableClass()
class FlashCard with FlashCardMappable {
  @MappableField(key: "_id")
  String id;

  @MappableField(key: "side_front")
  String? sideFront;

  @MappableField(key: "side_back")
  String? sideBack;

  @MappableField(key: "deck_index")
  int deckIndex;

  @MappableField(key: "id_deck")
  String deckId;

  FlashCard(
      this.id,
      this.deckId,
      this.deckIndex,
      this.sideFront,
      this.sideBack
      );
}
