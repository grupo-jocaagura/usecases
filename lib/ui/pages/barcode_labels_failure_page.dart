import 'package:flutter/material.dart';

import '../../domain/models/barcode_model.dart';
import '../../viewmodels/barcode_viewmodel_failure.dart';
import '../widgets/error_handler_widget.dart';

class BarcodeLabelsFailurePage extends StatelessWidget {
  const BarcodeLabelsFailurePage({
    required this.viewModel,
    super.key,
  });

  final BarcodeViewModelFailure viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etiquetas con manejo de errores'),
        actions: <Widget>[
          IconButton(
            onPressed: viewModel.fetchBarcodes,
            icon: const Icon(Icons.refresh),
            tooltip: 'Cargar códigos',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.fetchBarcodes,
        tooltip: 'Agregar código manual',
        child: const Icon(Icons.add),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (_, __) {
          return ErrorHandlerWidget(
            viewModel: viewModel,
            child: Builder(
              builder: (_) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (viewModel.barcodes.isEmpty) {
                  return const Center(
                    child: Text('No hay códigos disponibles.'),
                  );
                }
                return ListView.builder(
                  itemCount: viewModel.barcodes.length,
                  itemBuilder: (_, int index) {
                    final BarcodeModel barcode = viewModel.barcodes[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.qr_code),
                        title: Text(barcode.code),
                        subtitle: Text(barcode.description),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
