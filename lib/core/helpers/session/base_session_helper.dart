import '../../constants/session_constants.dart';
import 'i_base_session_helper.dart';

abstract class BaseSessionHelper implements IBaseSessionHelper {
  Future<void> setToken(String data) {
    return setRawString(SessionConstants.token, data);
  }

  String? getToken() {
    return getRawString(SessionConstants.token);
  }
}
