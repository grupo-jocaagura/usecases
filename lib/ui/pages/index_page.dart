import 'package:flutter/material.dart';

import '../providers/barcode_state_manager.dart';
import '../widgets/navigator_list_tile.dart';
import 'barcode_labels_failure_page.dart';
import 'barcode_labels_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BarcodeStateManager manager = BarcodeStateManager.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona una demo'),
      ),
      body: ListView(
        children: <Widget>[
          const NavigatorListTile(
            icon: Icon(Icons.check_circle_outline),
            page: BarcodeLabelsPage(),
            title: 'Demo ViewModel clásico',
            subTitle: 'Sin manejo de errores con Either/ErrorItem',
          ),
          NavigatorListTile(
            icon: const Icon(Icons.error_outline),
            page: BarcodeLabelsFailurePage(
              viewModel: manager.failureViewModel,
            ),
            title: 'Demo ViewModel con manejo de errores',
            subTitle: 'Con Either<ErrorItem, R> y diferenciación visual',
          ),
        ],
      ),
    );
  }
}
