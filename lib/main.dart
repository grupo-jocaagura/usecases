import 'package:flutter/material.dart';

import 'data/gateways/barcode_gateway_http_impl.dart';
import 'data/gateways/barcode_gateway_impl.dart';
import 'data/repositories/barcode_repository_failure_impl.dart';
import 'data/repositories/barcode_repository_impl.dart';
import 'domain/usecases/generate_new_barcodes_usecase.dart';
import 'domain/usecases/get_barcodes_usecase.dart';
import 'mock_services/mock_http_api.dart';
import 'ui/pages/index_page.dart';
import 'ui/providers/barcode_state_manager.dart';
import 'viewmodels/barcode_viewmodel.dart';
import 'viewmodels/barcode_viewmodel_failure.dart';

void main() {
  final BarcodeViewModel viewModel = BarcodeViewModel(
    getBarcodesUseCase: GetBarcodesUsecase(
      BarcodeRepositoryImpl(gateway: BarcodeGatewayImpl()),
    ),
    generateNewBarcodesUsecase: GenerateNewBarcodesUsecase(
      BarcodeRepositoryImpl(gateway: BarcodeGatewayImpl()),
    ),
  );

  final BarcodeViewModelFailure failureViewModel = BarcodeViewModelFailure(
    repository: BarcodeRepositoryFailureImpl(
      gateway: BarcodeGatewayHttpImpl(api: MockHttpApi()),
    ),
  );

  runApp(
    BarcodeStateManager(
      viewModel: viewModel,
      failureViewModel: failureViewModel,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Usecases & Error Handling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IndexPage(),
    );
  }
}
