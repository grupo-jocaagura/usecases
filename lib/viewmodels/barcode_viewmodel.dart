import 'package:flutter/material.dart';

import '../domain/entities/viewmodel.dart';
import '../domain/models/barcode_model.dart';
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
  BarcodeViewModel({required this.getBarcodesUseCase});
  final GetBarcodesUsecase getBarcodesUseCase;
  List<BarcodeModel> _barcodes = <BarcodeModel>[];
  bool _isLoading = false;

  List<BarcodeModel> get barcodes => _barcodes;
  bool get isLoading => _isLoading;

  Future<void> fetchBarcodes() async {
    debugPrint('🐱‍👤 Solicitando en el view model');
    _isLoading = true;
    notifyListeners();

    _barcodes = await getBarcodesUseCase.execute();

    _isLoading = false;
    notifyListeners();
  }
}
