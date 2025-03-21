import 'package:flutter/widgets.dart';

import '../../domain/entities/state_manager.dart';
import '../../viewmodels/barcode_viewmodel.dart';

class BarcodeStateManager extends StateManager {
  const BarcodeStateManager({
    required this.viewModel,
    required super.child,
    super.key,
  });
  final BarcodeViewModel viewModel;

  /// Funcion estático para acceder fácilmente al ViewModel
  static BarcodeStateManager of(BuildContext context) {
    debugPrint('🐱‍👤 Recuperando el manejador de estado');
    final BarcodeStateManager? provider =
        context.dependOnInheritedWidgetOfExactType<BarcodeStateManager>();
    assert(
      provider != null,
      'BarcodeProvider no encontrado en el árbol de widgets.',
    );
    return provider!;
  }

  /// No se notifica a los widgets hijos cuando el ViewModel cambia,
  /// porque el ViewModel mismo (ej: ChangeNotifier) maneja su propio estado.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
