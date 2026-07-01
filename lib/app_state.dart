import 'package:flutter/material.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _currentProviderProfileId = '';
  String get currentProviderProfileId => _currentProviderProfileId;
  set currentProviderProfileId(String value) {
    _currentProviderProfileId = value;
  }

  bool _isProvider = false;
  bool get isProvider => _isProvider;
  set isProvider(bool value) {
    _isProvider = value;
  }

  bool _providerOnboardingCompleted = false;
  bool get providerOnboardingCompleted => _providerOnboardingCompleted;
  set providerOnboardingCompleted(bool value) {
    _providerOnboardingCompleted = value;
  }

  int _unreadNotificationsCount = 0;
  int get unreadNotificationsCount => _unreadNotificationsCount;
  set unreadNotificationsCount(int value) {
    _unreadNotificationsCount = value;
  }
}
