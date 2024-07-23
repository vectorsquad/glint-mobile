part of 'notifiers.dart';

class DeckNotifier extends ChangeNotifier {

  Deck props;
  Map<String, dynamic> params = HashMap();
  Timer? _queuedRefresh;

  DeckNotifier({required this.props}) {
    _resetParams();
  }

  void setParam(String key, dynamic value) => params[key] = value;

  void _resetParams() {
    params = props.toMap();
    params["_id"] = props.id;
  }

  Future<void> refresh() async {
    final Val(:ok) = await getDeck({"_id": props.id});
    if(ok == null) {
      log("could not retrieve deck");
      return;
    }

    props = DeckMapper.fromMap(ok.data[0]);
    _resetParams();

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
