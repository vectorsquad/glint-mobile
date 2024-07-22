part of 'notifiers.dart';

class CardListNotifier extends ChangeNotifier {
  String deckId;
  List<FlashCard> _cache = [];
  UnmodifiableListView<FlashCard> get cached => UnmodifiableListView(_cache);
  Timer? queuedRefresh;
  final Map<String, Map<String, dynamic>> queuedParams = HashMap();

  CardListNotifier({required this.deckId}) {
    refresh();
  }

  void queueUpdate(FlashCard props, Map<String, dynamic> params) {
    if(queuedParams[props.id] == null) {
      queuedParams[props.id] = params;
    }
  }

  Future<void> submitUpdates() async {
    for(final params in queuedParams.values) {
      final Val(:ok, :other) = await updateCard(params);
      if(ok == null) {
        log(other);
      }
    }
  }

  void refreshDelayed({required Future<void> Function() beforeRefresh, required Duration duration}) {

    final queuedRefresh = this.queuedRefresh;
    if(queuedRefresh != null) {
      queuedRefresh.cancel();
    }

    this.queuedRefresh = Timer(duration, () async {
      await beforeRefresh();
      refresh();
    });
  }

  Future<void> refresh() async {
    ValRespFuture getCardListAll() => getCardList({"id_deck": deckId});

    final Val(:ok) = await getList(getCardListAll, FlashCardMapper.fromMap);
    if (ok == null) {
      return;
    }

    _cache = ok;
    notifyListeners();
  }
}
