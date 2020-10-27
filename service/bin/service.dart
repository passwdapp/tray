import 'dart:io';

import 'constants/config.dart';
import 'http/http_server.dart';
import 'utils/logger.dart';

void main(List<String> arguments) {
  if (arguments.length != 1) {
    exit(1);
  }

  Loggers.setupLogging();

  final httpService = ServiceHttpServer(
    listenAddress,
    servicePort,
    arguments[0],
  );

  httpService.listen();
}
