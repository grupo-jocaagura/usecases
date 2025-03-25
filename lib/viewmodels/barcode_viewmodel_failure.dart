import 'package:jocaagura_domain/jocaagura_domain.dart';

import '../domain/entities/viewmodel.dart';
import '../domain/models/barcode_model.dart';
import '../domain/models/error_item.dart';
import '../domain/repositories/barcode_repository_failure.dart';

class BarcodeViewModelFailure extends ViewModel {
  BarcodeViewModelFailure({
    required this.repository,
  });

  final BarcodeRepositoryFailure repository;

  List<BarcodeModel> _barcodes = <BarcodeModel>[];
  ErrorItem? _error;
  bool _isLoading = false;

  List<BarcodeModel> get barcodes => _barcodes;
  ErrorItem? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> fetchBarcodes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final Either<ErrorItem, List<BarcodeModel>> result =
        await repository.getBarcodes();

    result.when(
      (ErrorItem err) {
        _error = err;
        _barcodes = <BarcodeModel>[];
      },
      (List<BarcodeModel> data) {
        _barcodes = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> generateManualBarcode() async {
    final List<BarcodeModel> newOnes = await repository.generateNewBarcodes();
    _barcodes.addAll(newOnes);
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
