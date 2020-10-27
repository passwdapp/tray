import 'dart:io';

import '../utils/logger.dart';

class ServiceHttpServer {
  final int port;
  final InternetAddress address;

  ServiceHttpServer(this.address, this.port);

  void listen() async {
    final server = await HttpServer.bind(address, port);
    Loggers.HttpLogger.info('HTTP Server listening on 127.0.0.1:$port');

    await for (final req in server) {
      switch (req.uri.path) {
        case '/ping':
          req.response.write('Pong');
          break;

        case '/ws':
          final publicKey = req.uri.queryParameters['key'];
          // TODO: implement authorization logic here

          if (publicKey == null) {
            break;
          }

          try {
            final socket = await WebSocketTransformer.upgrade(req);

            socket.listen((event) {
              socket.add(event);
              print(event);
            });
          } catch (e) {
            Loggers.HttpLogger.severe(e);
          }

          break;

        default:
          req.response.statusCode = 404;
          req.response.write('Not found');

          break;
      }

      await req.response.close();
    }
  }
}
