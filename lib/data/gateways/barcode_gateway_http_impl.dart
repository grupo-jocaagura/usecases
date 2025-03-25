import 'package:jocaagura_domain/jocaagura_domain.dart';

import '../../domain/gateways/barcode_gateway_failure.dart';
import '../../domain/models/error_item.dart';
import '../../mock_services/mock_http_api.dart';
import '../../mock_services/mock_socket_api.dart';

class BarcodeGatewayHttpImpl implements BarcodeGatewayFailure {
  BarcodeGatewayHttpImpl({required this.api});
  final MockHttpApi api;

  @override
  Future<Either<ErrorItem, Map<String, dynamic>>> fetchBarcodesFromApi() async {
    try {
      final Map<String, dynamic> data = await api.getData();
      return Right<ErrorItem, Map<String, dynamic>>(data);
    } catch (e) {
      return Left<ErrorItem, Map<String, dynamic>>(
        ErrorItem(
          title: 'Error de Red',
          code: 'network_error',
          description: e.toString(),
        ),
      );
    }
  }

  Stream<Either<ErrorItem, Map<String, dynamic>>>
      listenToBarcodeEvents() async* {
    final MockSocketApi socket = MockSocketApi();
    await for (final Map<String, dynamic> event in socket.events) {
      try {
        yield Right<ErrorItem, Map<String, dynamic>>(event);
      } catch (e) {
        yield Left<ErrorItem, Map<String, dynamic>>(
          ErrorItem(
            title: 'Error de Socket',
            code: 'socket_error',
            description: e.toString(),
            type: ErrorType.blocking,
          ),
        );
      }
    }
  }
}
