abstract class IBaseSessionHelper {
  Future<void> clear();

  Set<String> getKeys();

  String? getRawString(String key);

  Future<void> setRawString(String key, String data);

  bool? getRawBoolean(String key);

  Future<void> setRawBoolean(String key, bool data);

  int? getRawInteger(String key);

  Future<void> setRawInteger(String key, int data);

  double? getRawDouble(String key);

  Future<void> setRawDouble(String key, double data);

  Map<String, dynamic>? getRawMap(String key);

  Future<void> setRawMap(String key, Map<String, dynamic> data);

  Future<void> remove(String key);

  List<String>? getRawList(String key);

  Future<void> setRawList(String key, List<String> data);
}
