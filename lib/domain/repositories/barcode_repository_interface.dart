import '../entities/repository.dart';
import '../models/barcode_model.dart';

abstract class BarcodeRepositoryInterface extends Repository {
  Future<List<BarcodeModel>> getBarcodes();
}
