import 'package:jocaagura_domain/jocaagura_domain.dart';

import '../entities/repository.dart';
import '../models/barcode_model.dart';
import '../models/error_item.dart';

/// Interfaz del repositorio de códigos de barras.
abstract class BarcodeRepositoryFailure extends Repository {
  /// Obtiene la lista de códigos de barras desde una fuente externa.
  Future<Either<ErrorItem, List<BarcodeModel>>> getBarcodes();

  /// Genera nuevos códigos aleatorios desde una fuente externa.
  Future<List<BarcodeModel>> generateNewBarcodes();
}
