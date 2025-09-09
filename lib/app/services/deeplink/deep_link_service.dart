import 'dart:async';
import 'package:flutter/services.dart';

class DeepLinkService {
  DeepLinkService._internal();

  static final DeepLinkService _instance = DeepLinkService._internal();

  factory DeepLinkService() => _instance;

  EventChannel stream =
      const EventChannel('burblelife.com.burblelife.app/events');
  MethodChannel platform =
      const MethodChannel("burblelife.com.burblelife.app/channel");
  final StreamController<String> _stateController = StreamController();

  Stream<String> get deepLinkStream => _stateController.stream;

  Sink<String> get deepLinkSink => _stateController.sink;

  ///Call method channel here
  Future<Object> startUri() async {
    try {
      return platform.invokeMethod('initialLink');
    } on PlatformException catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  /// init Deeplink here
  Future<void> initDeepLink() async {
    await startUri().then(_onRedirected);
    stream.receiveBroadcastStream().listen((d) => _onRedirected(d));
  }

  _onRedirected(Object uri) {
    if (uri is String) {
      deepLinkSink.add(uri);
    } else {}
  }

  void disposeDeepLink() {
    _stateController.close();
  }
}
