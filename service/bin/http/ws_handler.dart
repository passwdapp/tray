import 'dart:convert';
import 'dart:io';

import '../models/request.dart';
import '../utils/logger.dart';

void handleWS(WebSocket socket) {
  socket.listen((event) {
    final data = json.decode(event.toString());
    final request = RPCRequest.fromJson(data);

    switch (request.type) {
      case 'search':
        final params = SearchRequestParams.fromJson(request.params);
        Loggers.HttpLogger.info('Got search query ${params.query}');

        break;

      default:
        break;
    }
  });
}
