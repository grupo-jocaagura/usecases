import 'package:jocaagura_domain/jocaagura_domain.dart';

import '../models/error_item.dart';

abstract class BarcodeGatewayFailure {
  const BarcodeGatewayFailure();
  Future<Either<ErrorItem, Map<String, dynamic>>> fetchBarcodesFromApi();
}
