import 'package:flutter/material.dart';

import '../../viewmodels/barcode_viewmodel.dart';
import '../providers/barcode_state_manager.dart';
import 'label_widget.dart';

class BarcodeListViewWidget extends StatelessWidget {
  const BarcodeListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BarcodeViewModel viewModel =
        BarcodeStateManager.of(context).viewModel;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, Widget? child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: viewModel.barcodes.length,
          itemBuilder: (_, int index) {
            return LabelWidget(barcode: viewModel.barcodes[index]);
          },
        );
      },
    );
  }
}
