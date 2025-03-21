import 'package:flutter/material.dart';

import '../../viewmodels/barcode_viewmodel.dart';
import '../providers/barcode_state_manager.dart';

class AddBarcodeButton extends StatelessWidget {
  const AddBarcodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final BarcodeViewModel viewModel =
        BarcodeStateManager.of(context).viewModel;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        debugPrint('🐱‍👤 Redibujando la pantalla ${viewModel.isLoading}');
        return FloatingActionButton(
          onPressed: viewModel.isLoading ? null : viewModel.fetchBarcodes,
          tooltip: 'Generar código aleatorio',
          child: viewModel.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Icon(Icons.add),
        );
      },
    );
  }
}
