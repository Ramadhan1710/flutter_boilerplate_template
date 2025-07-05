import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_session_helper.dart';

class SharedPrefHelper extends BaseSessionHelper {
  final SharedPreferences _sharedPreferences;

  SharedPrefHelper(this._sharedPreferences);

  @override
  Future<void> clear() async {
    bool result = await _sharedPreferences.clear();
    if (!result) {
      return Future.error("cannot clear data");
    }
  }

  @override
  bool? getRawBoolean(String key) {
    return _sharedPreferences.getBool(key);
  }

  @override
  int? getRawInteger(String key) {
    return _sharedPreferences.getInt(key);
  }

  @override
  Map<String, dynamic>? getRawMap(String key) {
    String? output = getRawString(key);

    if (output != null) {
      return json.decode(output);
    }
    return null;
  }

  @override
  String? getRawString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  Future<void> setRawBoolean(String key, bool data) async {
    bool result = await _sharedPreferences.setBool(key, data);
    if (!result) {
      return Future.error("cannot save data");
    }
  }

  @override
  Future<void> setRawInteger(String key, int data) async {
    bool result = await _sharedPreferences.setInt(key, data);
    if (!result) {
      return Future.error("cannot save data");
    }
  }

  @override
  Future<void> setRawMap(String key, Map<String, dynamic> data) async {
    bool result = await _sharedPreferences.setString(key, json.encode(data));
    if (!result) {
      return Future.error("cannot save data");
    }
  }

  @override
  Future<void> setRawString(String key, String data) async {
    bool result = await _sharedPreferences.setString(key, data);
    if (!result) {
      return Future.error("cannot save data");
    }
  }

  @override
  Future<void> remove(String key) async {
    bool result = await _sharedPreferences.remove(key);
    if (!result) {
      return Future.error("cannot remove data");
    }
  }

  @override
  Set<String> getKeys() {
    return _sharedPreferences.getKeys();
  }

  @override
  double? getRawDouble(String key) {
    var raw = getRawString(key);
    if (raw != null) {
      return double.tryParse(raw);
    }
    return null;
  }

  @override
  Future<void> setRawDouble(String key, double data) {
    return setRawString(key, data.toString());
  }

  @override
  List<String>? getRawList(String key) {
    String? jsonString = _sharedPreferences.getString(key);
    if (jsonString != null) {
      return List<String>.from(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<void> setRawList(String key, List<String> data) async {
    bool result = await _sharedPreferences.setString(key, json.encode(data));
    print("setRawList: $key, $data, $result");
    if (!result) {
      return Future.error("cannot save data");
    }
  }
}
