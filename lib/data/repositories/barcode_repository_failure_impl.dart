import 'package:jocaagura_domain/jocaagura_domain.dart';

import '../../domain/gateways/barcode_gateway_failure.dart';
import '../../domain/models/barcode_model.dart';
import '../../domain/models/error_item.dart';
import '../../domain/repositories/barcode_repository_failure.dart';

class BarcodeRepositoryFailureImpl implements BarcodeRepositoryFailure {
  const BarcodeRepositoryFailureImpl({required this.gateway});
  final BarcodeGatewayFailure gateway;

  @override
  Future<Either<ErrorItem, List<BarcodeModel>>> getBarcodes() async {
    final Either<ErrorItem, Map<String, dynamic>> result =
        await gateway.fetchBarcodesFromApi();

    return result.fold(
      (ErrorItem error) => Left<ErrorItem, List<BarcodeModel>>(error),
      (Map<String, dynamic> json) {
        try {
          if (!json.containsKey('code') || !json.containsKey('description')) {
            return Left<ErrorItem, List<BarcodeModel>>(
              const ErrorItem(
                title: 'Error de datos',
                code: 'invalid_data',
                description: 'Faltan campos requeridos',
                type: ErrorType.blocking,
              ),
            );
          }

          final BarcodeModel barcode = BarcodeModel(
            code: json['code'].toString(),
            description: json['description'].toString(),
          );

          return Right<ErrorItem, List<BarcodeModel>>(<BarcodeModel>[barcode]);
        } catch (e) {
          return Left<ErrorItem, List<BarcodeModel>>(
            ErrorItem(
              title: 'Error de mapeo',
              code: 'mapping_error',
              description: e.toString(),
              type: ErrorType.blocking,
            ),
          );
        }
      },
    );
  }

  @override
  Future<List<BarcodeModel>> generateNewBarcodes() async {
    return <BarcodeModel>[
      BarcodeModel(
        code: 'NEW${DateTime.now().millisecondsSinceEpoch}',
        description: 'Generado manualmente',
      ),
    ];
  }
}
