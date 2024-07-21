part of 'notifiers.dart';

class ApiConfigNotifier extends ChangeNotifier {

  bool isSecure() => currentProtocol == "https";

  void toggleSecure(secure) {
    currentProtocol = secure ? "https" : "http";
    log(apiUrl("lmao"));
    notifyListeners();
  }

  void setApiHost(String s) {
    currentHost = s.isEmpty ? glintHost : s;
    notifyListeners();
  }

}
