import '../entities/repository.dart';
import '../models/barcode_model.dart';

/// Interfaz del repositorio de códigos de barras.
abstract class BarcodeRepositoryInterface extends Repository {
  /// Obtiene la lista de códigos de barras desde una fuente externa.
  Future<List<BarcodeModel>> getBarcodes();

  /// Genera nuevos códigos aleatorios desde una fuente externa.
  Future<List<BarcodeModel>> generateNewBarcodes();
}
