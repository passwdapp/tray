import 'constants/config.dart';
import 'http/http_server.dart';
import 'utils/logger.dart';

void main(List<String> arguments) {
  Loggers.setupLogging();

  final httpService = ServiceHttpServer(listenAddress, servicePort);
  httpService.listen();
}
