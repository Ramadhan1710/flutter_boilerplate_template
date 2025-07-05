import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerHelper {
  static final LoggerHelper _instance = LoggerHelper._internal();
  factory LoggerHelper() => _instance;
  late final Logger _logger;

  LoggerHelper._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 100,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: kDebugMode ? Level.debug : Level.off,
    );
  }

  static Logger get logger => _instance._logger;
}
