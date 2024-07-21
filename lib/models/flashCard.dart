part of 'models.dart';

@MappableClass()
class FlashCard with FlashCardMappable {
  @MappableField(key: "_id")
  String id;

  String side_front;
  String side_back;
  String id_deck;
  int deck_index;

  FlashCard(
      this.id, this.side_front, this.side_back, this.id_deck, this.deck_index);
}
