import 'package:logger/logger.dart';

class TLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );

  static void debug(String message) {
    _logger.d(message);
  }
   static void fatal(String message) {
    _logger.f(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warining(String message) {
    _logger.w(message);
  }

  static void error(String message) {
    _logger.e(message);
  }

}
