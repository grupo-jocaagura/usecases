import 'package:flutter/material.dart';

import 'data/gateways/barcode_gateway_impl.dart';
import 'data/repositories/barcode_repository_impl.dart';
import 'domain/gateways/barcode_gateway_random_impl.dart';
import 'domain/usecases/generate_new_barcodes_usecase.dart';
import 'domain/usecases/get_barcodes_usecase.dart';
import 'ui/pages/barcode_labels_page.dart';
import 'ui/providers/barcode_state_manager.dart';
import 'viewmodels/barcode_viewmodel.dart';

void main() {
  runApp(
    BarcodeStateManager(
      viewModel: BarcodeViewModel(
        getBarcodesUseCase: GetBarcodesUsecase(
          BarcodeRepositoryImpl(gateway: BarcodeGatewayImpl()),
        ),
        generateNewBarcodesUsecase: GenerateNewBarcodesUsecase(
          BarcodeRepositoryImpl(
            gateway: BarcodeGatewayRandomImpl(),
          ),
        ),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usecases Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BarcodeLabelsPage(),
    );
  }
}
