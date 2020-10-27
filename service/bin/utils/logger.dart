import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

class Loggers {
  static void setupLogging() {
    Logger.root.level = Level.ALL;

    PrintAppender(formatter: const ColorFormatter())
      ..attachToLogger(Logger.root);
  }

  static Logger get HttpLogger => Logger('HTTP');
}
