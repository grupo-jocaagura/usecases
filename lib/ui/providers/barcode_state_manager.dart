import 'package:flutter/widgets.dart';

import '../../domain/entities/state_manager.dart';
import '../../viewmodels/barcode_viewmodel.dart';
import '../../viewmodels/barcode_viewmodel_failure.dart';

class BarcodeStateManager extends StateManager {
  const BarcodeStateManager({
    required this.viewModel,
    required this.failureViewModel,
    required super.child,
    super.key,
  });

  final BarcodeViewModel viewModel;
  final BarcodeViewModelFailure failureViewModel;

  static BarcodeStateManager of(BuildContext context) {
    final BarcodeStateManager? provider =
        context.dependOnInheritedWidgetOfExactType<BarcodeStateManager>();
    assert(provider != null, 'BarcodeStateManager no encontrado.');
    return provider!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
