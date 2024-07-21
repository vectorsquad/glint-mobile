// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'models.dart';

class DeckMapper extends ClassMapperBase<Deck> {
  DeckMapper._();

  static DeckMapper? _instance;
  static DeckMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeckMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Deck';

  static String _$id(Deck v) => v.id;
  static const Field<Deck, String> _f$id = Field('id', _$id, key: '_id');
  static String _$userId(Deck v) => v.userId;
  static const Field<Deck, String> _f$userId =
      Field('userId', _$userId, key: 'id_user');
  static String _$name(Deck v) => v.name;
  static const Field<Deck, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Deck> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #name: _f$name,
  };

  static Deck _instantiate(DecodingData data) {
    return Deck(data.dec(_f$id), data.dec(_f$userId), data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Deck fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Deck>(map);
  }

  static Deck fromJson(String json) {
    return ensureInitialized().decodeJson<Deck>(json);
  }
}

mixin DeckMappable {
  String toJson() {
    return DeckMapper.ensureInitialized().encodeJson<Deck>(this as Deck);
  }

  Map<String, dynamic> toMap() {
    return DeckMapper.ensureInitialized().encodeMap<Deck>(this as Deck);
  }

  DeckCopyWith<Deck, Deck, Deck> get copyWith =>
      _DeckCopyWithImpl(this as Deck, $identity, $identity);
  @override
  String toString() {
    return DeckMapper.ensureInitialized().stringifyValue(this as Deck);
  }

  @override
  bool operator ==(Object other) {
    return DeckMapper.ensureInitialized().equalsValue(this as Deck, other);
  }

  @override
  int get hashCode {
    return DeckMapper.ensureInitialized().hashValue(this as Deck);
  }
}

extension DeckValueCopy<$R, $Out> on ObjectCopyWith<$R, Deck, $Out> {
  DeckCopyWith<$R, Deck, $Out> get $asDeck =>
      $base.as((v, t, t2) => _DeckCopyWithImpl(v, t, t2));
}

abstract class DeckCopyWith<$R, $In extends Deck, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? userId, String? name});
  DeckCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DeckCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Deck, $Out>
    implements DeckCopyWith<$R, Deck, $Out> {
  _DeckCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Deck> $mapper = DeckMapper.ensureInitialized();
  @override
  $R call({String? id, String? userId, String? name}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (userId != null) #userId: userId,
        if (name != null) #name: name
      }));
  @override
  Deck $make(CopyWithData data) => Deck(data.get(#id, or: $value.id),
      data.get(#userId, or: $value.userId), data.get(#name, or: $value.name));

  @override
  DeckCopyWith<$R2, Deck, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DeckCopyWithImpl($value, $cast, t);
}

class ErrorResponseMapper extends ClassMapperBase<ErrorResponse> {
  ErrorResponseMapper._();

  static ErrorResponseMapper? _instance;
  static ErrorResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ErrorResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ErrorResponse';

  static String _$message(ErrorResponse v) => v.message;
  static const Field<ErrorResponse, String> _f$message =
      Field('message', _$message);

  @override
  final MappableFields<ErrorResponse> fields = const {
    #message: _f$message,
  };

  static ErrorResponse _instantiate(DecodingData data) {
    return ErrorResponse(data.dec(_f$message));
  }

  @override
  final Function instantiate = _instantiate;

  static ErrorResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ErrorResponse>(map);
  }

  static ErrorResponse fromJson(String json) {
    return ensureInitialized().decodeJson<ErrorResponse>(json);
  }
}

mixin ErrorResponseMappable {
  String toJson() {
    return ErrorResponseMapper.ensureInitialized()
        .encodeJson<ErrorResponse>(this as ErrorResponse);
  }

  Map<String, dynamic> toMap() {
    return ErrorResponseMapper.ensureInitialized()
        .encodeMap<ErrorResponse>(this as ErrorResponse);
  }

  ErrorResponseCopyWith<ErrorResponse, ErrorResponse, ErrorResponse>
      get copyWith => _ErrorResponseCopyWithImpl(
          this as ErrorResponse, $identity, $identity);
  @override
  String toString() {
    return ErrorResponseMapper.ensureInitialized()
        .stringifyValue(this as ErrorResponse);
  }

  @override
  bool operator ==(Object other) {
    return ErrorResponseMapper.ensureInitialized()
        .equalsValue(this as ErrorResponse, other);
  }

  @override
  int get hashCode {
    return ErrorResponseMapper.ensureInitialized()
        .hashValue(this as ErrorResponse);
  }
}

extension ErrorResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ErrorResponse, $Out> {
  ErrorResponseCopyWith<$R, ErrorResponse, $Out> get $asErrorResponse =>
      $base.as((v, t, t2) => _ErrorResponseCopyWithImpl(v, t, t2));
}

abstract class ErrorResponseCopyWith<$R, $In extends ErrorResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? message});
  ErrorResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ErrorResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ErrorResponse, $Out>
    implements ErrorResponseCopyWith<$R, ErrorResponse, $Out> {
  _ErrorResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ErrorResponse> $mapper =
      ErrorResponseMapper.ensureInitialized();
  @override
  $R call({String? message}) =>
      $apply(FieldCopyWithData({if (message != null) #message: message}));
  @override
  ErrorResponse $make(CopyWithData data) =>
      ErrorResponse(data.get(#message, or: $value.message));

  @override
  ErrorResponseCopyWith<$R2, ErrorResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ErrorResponseCopyWithImpl($value, $cast, t);
}

class FlashCardMapper extends ClassMapperBase<FlashCard> {
  FlashCardMapper._();

  static FlashCardMapper? _instance;
  static FlashCardMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FlashCardMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FlashCard';

  static String _$id(FlashCard v) => v.id;
  static const Field<FlashCard, String> _f$id = Field('id', _$id, key: '_id');
  static String _$side_front(FlashCard v) => v.side_front;
  static const Field<FlashCard, String> _f$side_front =
      Field('side_front', _$side_front);
  static String _$side_back(FlashCard v) => v.side_back;
  static const Field<FlashCard, String> _f$side_back =
      Field('side_back', _$side_back);
  static String _$id_deck(FlashCard v) => v.id_deck;
  static const Field<FlashCard, String> _f$id_deck =
      Field('id_deck', _$id_deck);
  static int _$deck_index(FlashCard v) => v.deck_index;
  static const Field<FlashCard, int> _f$deck_index =
      Field('deck_index', _$deck_index);

  @override
  final MappableFields<FlashCard> fields = const {
    #id: _f$id,
    #side_front: _f$side_front,
    #side_back: _f$side_back,
    #id_deck: _f$id_deck,
    #deck_index: _f$deck_index,
  };

  static FlashCard _instantiate(DecodingData data) {
    return FlashCard(data.dec(_f$id), data.dec(_f$side_front),
        data.dec(_f$side_back), data.dec(_f$id_deck), data.dec(_f$deck_index));
  }

  @override
  final Function instantiate = _instantiate;

  static FlashCard fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FlashCard>(map);
  }

  static FlashCard fromJson(String json) {
    return ensureInitialized().decodeJson<FlashCard>(json);
  }
}

mixin FlashCardMappable {
  String toJson() {
    return FlashCardMapper.ensureInitialized()
        .encodeJson<FlashCard>(this as FlashCard);
  }

  Map<String, dynamic> toMap() {
    return FlashCardMapper.ensureInitialized()
        .encodeMap<FlashCard>(this as FlashCard);
  }

  FlashCardCopyWith<FlashCard, FlashCard, FlashCard> get copyWith =>
      _FlashCardCopyWithImpl(this as FlashCard, $identity, $identity);
  @override
  String toString() {
    return FlashCardMapper.ensureInitialized()
        .stringifyValue(this as FlashCard);
  }

  @override
  bool operator ==(Object other) {
    return FlashCardMapper.ensureInitialized()
        .equalsValue(this as FlashCard, other);
  }

  @override
  int get hashCode {
    return FlashCardMapper.ensureInitialized().hashValue(this as FlashCard);
  }
}

extension FlashCardValueCopy<$R, $Out> on ObjectCopyWith<$R, FlashCard, $Out> {
  FlashCardCopyWith<$R, FlashCard, $Out> get $asFlashCard =>
      $base.as((v, t, t2) => _FlashCardCopyWithImpl(v, t, t2));
}

abstract class FlashCardCopyWith<$R, $In extends FlashCard, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? side_front,
      String? side_back,
      String? id_deck,
      int? deck_index});
  FlashCardCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FlashCardCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FlashCard, $Out>
    implements FlashCardCopyWith<$R, FlashCard, $Out> {
  _FlashCardCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FlashCard> $mapper =
      FlashCardMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? side_front,
          String? side_back,
          String? id_deck,
          int? deck_index}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (side_front != null) #side_front: side_front,
        if (side_back != null) #side_back: side_back,
        if (id_deck != null) #id_deck: id_deck,
        if (deck_index != null) #deck_index: deck_index
      }));
  @override
  FlashCard $make(CopyWithData data) => FlashCard(
      data.get(#id, or: $value.id),
      data.get(#side_front, or: $value.side_front),
      data.get(#side_back, or: $value.side_back),
      data.get(#id_deck, or: $value.id_deck),
      data.get(#deck_index, or: $value.deck_index));

  @override
  FlashCardCopyWith<$R2, FlashCard, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FlashCardCopyWithImpl($value, $cast, t);
}
