part of 'notifiers.dart';

class CardListNotifier extends ChangeNotifier {
  Deck props;
  List<FlashCard> _cache = [];

  UnmodifiableListView<FlashCard> get cached => UnmodifiableListView(_cache);
  Timer? queuedRefresh;
  Map<String, Map<String, dynamic>> _queuedParams = HashMap();

  CardListNotifier({required this.props}) {
    refresh();
  }

  void queueUpdate(FlashCard props, Map<String, dynamic> params) {
    if (_queuedParams[props.id] == null) {
      _queuedParams[props.id] = params;
    }
  }

  void clearUpdates() {
    _queuedParams = HashMap();
  }

  Future<void> submitUpdates() async {
    for(final params in _queuedParams.values) {
      final Val(:ok, :other) = await updateCard(params);
    }
  }

  void refreshDelayed({required Future<void> Function() beforeRefresh, required Duration duration}) {
    final queuedRefresh = this.queuedRefresh;
    if(queuedRefresh != null) {
      queuedRefresh.cancel();
    }

    this.queuedRefresh = Timer(duration, () async {
      await beforeRefresh();
      await refresh();
    });
  }

  Future<void> refresh() async {
    ValRespFuture getCardListAll() => getCardList({"id_deck": props.id});

    final Val(:ok) = await getList(getCardListAll, FlashCardMapper.fromMap);
    if (ok == null) {
      return;
    }

    log(jsonEncode(ok));

    _cache = ok;
    notifyListeners();
  }
}
