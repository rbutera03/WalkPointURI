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
      _temp = prefs.getDouble('ff_temp') ?? _temp;
    });
    _safeInit(() {
      _date = prefs.getString('ff_date') ?? _date;
    });
    _safeInit(() {
      _dayOfWeek = prefs.getString('ff_dayOfWeek') ?? _dayOfWeek;
    });
    _safeInit(() {
      _weatherIconNumber =
          prefs.getInt('ff_weatherIconNumber') ?? _weatherIconNumber;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _temp = 0.0;
  double get temp => _temp;
  set temp(double value) {
    _temp = value;
    prefs.setDouble('ff_temp', value);
  }

  String _date = '';
  String get date => _date;
  set date(String value) {
    _date = value;
    prefs.setString('ff_date', value);
  }

  String _dayOfWeek = '';
  String get dayOfWeek => _dayOfWeek;
  set dayOfWeek(String value) {
    _dayOfWeek = value;
    prefs.setString('ff_dayOfWeek', value);
  }

  int _weatherIconNumber = 0;
  int get weatherIconNumber => _weatherIconNumber;
  set weatherIconNumber(int value) {
    _weatherIconNumber = value;
    prefs.setInt('ff_weatherIconNumber', value);
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
