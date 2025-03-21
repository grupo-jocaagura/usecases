import 'package:flutter/material.dart';

import '../domain/entities/viewmodel.dart';
import '../domain/models/barcode_model.dart';
import '../domain/usecases/generate_new_barcodes_usecase.dart';
import '../domain/usecases/get_barcodes_usecase.dart';

/// ViewModel encargado de gestionar el estado de la lista de códigos de barras.
///
/// Se comunica con el caso de uso `GetBarcodesUsecase` para obtener los datos.
///
/// Ejemplo de uso:
/// ```dart
/// final viewModel = BarcodeViewModel(getBarcodesUseCase: usecase);
/// await viewModel.fetchBarcodes();
/// ```
class BarcodeViewModel extends ViewModel {
  BarcodeViewModel({
    required this.generateNewBarcodesUsecase,
    required this.getBarcodesUseCase,
  });
  final GetBarcodesUsecase getBarcodesUseCase;
  final GenerateNewBarcodesUsecase generateNewBarcodesUsecase;
  List<BarcodeModel> _barcodes = <BarcodeModel>[];
  bool _isLoading = false;
  bool _isFetchingNew = false;

  List<BarcodeModel> get barcodes => _barcodes;
  bool get isLoading => _isLoading;
  bool get isFetchingNew => _isFetchingNew;
  bool get activateButton => _isLoading || _isFetchingNew;

  Future<void> fetchBarcodes() async {
    debugPrint('🐱‍👤 Solicitando en el view model');
    _isLoading = true;
    notifyListeners();

    _barcodes = await getBarcodesUseCase.execute();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchNewBarcodes() async {
    _isFetchingNew = true;
    notifyListeners();
    if (barcodes.isEmpty) {
      await fetchBarcodes();
    }

    final List<BarcodeModel> newBarcodes =
        await generateNewBarcodesUsecase.execute();

    for (final BarcodeModel barcode in newBarcodes) {
      if (!_barcodes.any((BarcodeModel b) => b.code == barcode.code)) {
        _barcodes.add(barcode);
      }
    }

    _isFetchingNew = false;
    notifyListeners();
  }
}
