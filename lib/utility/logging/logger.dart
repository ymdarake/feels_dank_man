import 'package:logger/logger.dart' as logger;

// TODO:

abstract class ILogger {
  void info(String message);
}

class ConsoleLogger implements ILogger {
  logger.Logger delegate = logger.Logger();

  @override
  void info(String message) {
    delegate.i(message);
  }
}
