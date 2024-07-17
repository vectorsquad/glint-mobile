import 'dart:convert';
import 'dart:developer';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

bool cookieJarConfigured = false;
var cj = PersistCookieJar();

// Setup persisting cookie jar.
setupCookieJar() async {

  // Return early if cookie jar has already been setup
  if(cookieJarConfigured) {
    return;
  }

  // Get reference to and create app's cache dir
  var appCacheDir = await path_provider.getApplicationCacheDirectory();
  appCacheDir.create();

  // Configure cookie jar to persist inside of app's cache dir
  cj = PersistCookieJar(storage: FileStorage(appCacheDir.path));

  // Set cookie jar configuration to true in case of future invocations
  cookieJarConfigured = true;
}

var dio = Dio();

// Setup Dio-based HTTP fetcher
setupDio() async {
  setupCookieJar();
  dio.interceptors.add(CookieManager(cj));
}

final setupDioFuture = setupDio();

const hostname = "glint.cleanmango.com";
const hostUrl = "https://$hostname";
final hostUri = Uri.parse(hostUrl);
String apiUrl(String path) => "$hostUrl/api/v1/$path";
Uri apiUri(String path) => Uri.parse(apiUrl(path));

abstract class ApiResponseError {
  late String message;
  late dynamic details;
}

nonExistentCookie(String name) => "could not find cookie with name `$name`";

// Get first cookie that matches name
SerializableCookie? getSerializableCookie(String name ) {

  // Return null early if no cookies exist for API host
  log(jsonEncode(cj.hostCookies));
  final cookiesHost = cj.hostCookies[hostname];
  if(cookiesHost == null) {
    log("no cookies exist for API host");
    return null;
  }

  // Return cookie early if exist in even one of the cookie paths
  for(final cookiesPath in cookiesHost.values) {
    for(final cookieEntry in cookiesPath.entries) {
      if(cookieEntry.key == name) {
        return cookieEntry.value;
      }
    }
  }

  // Only here if no cookie with name exists in any paths for API hostname
  log(nonExistentCookie(name));
  return null;

}