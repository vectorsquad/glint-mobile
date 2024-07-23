part of 'notifiers.dart';

class DeckNotifier extends ChangeNotifier {

  Deck props;
  Map<String, dynamic> params = HashMap();
  Timer? _queuedRefresh;

  DeckNotifier({required this.props});

  void setParam(String key, dynamic value) => params[key] = value;

  void resetParams() {
    params = props.toMap();
    params["_id"] = props.id;
  }

  Future<void> refresh() async {
    final Val(:ok) = await getDeck({"_id": props.id});
    if(ok == null) {
      return;
    }

    props = DeckMapper.fromMap(ok.data[0]);
    resetParams();

    notifyListeners();
  }

  void refreshDelayed({required Future<void> Function() beforeRefresh, required Duration duration}) {
    final queuedRefresh = _queuedRefresh;
    if(queuedRefresh != null) {
      queuedRefresh.cancel();
    }

    _queuedRefresh = Timer(duration, () async {
      await beforeRefresh();
      await refresh();
    });
  }

}
