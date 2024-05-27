import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _level2 = prefs.getBool('ff_level2') ?? _level2;
    });
    _safeInit(() {
      _level3 = prefs.getBool('ff_level3') ?? _level3;
    });
    _safeInit(() {
      _level4 = prefs.getBool('ff_level4') ?? _level4;
    });
    _safeInit(() {
      _score = prefs.getInt('ff_score') ?? _score;
    });
    _safeInit(() {
      _caraudio = prefs.getString('ff_caraudio') ?? _caraudio;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _level2 = false;
  bool get level2 => _level2;
  set level2(bool value) {
    _level2 = value;
    prefs.setBool('ff_level2', value);
  }

  bool _level3 = false;
  bool get level3 => _level3;
  set level3(bool value) {
    _level3 = value;
    prefs.setBool('ff_level3', value);
  }

  bool _level4 = false;
  bool get level4 => _level4;
  set level4(bool value) {
    _level4 = value;
    prefs.setBool('ff_level4', value);
  }

  int _score = 0;
  int get score => _score;
  set score(int value) {
    _score = value;
    prefs.setInt('ff_score', value);
  }

  String _caraudio = '';
  String get caraudio => _caraudio;
  set caraudio(String value) {
    _caraudio = value;
    prefs.setString('ff_caraudio', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
