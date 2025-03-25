# UseCases Demo
![Coverage](https://img.shields.io/badge/coverage-99%25-brightgreen)
![Coverage](https://img.shields.io/badge/Author-@albertjjimenezp-brightgreen)
-------------------------------![Author](https://avatars.githubusercontent.com/u/35118534?s=200&u=80708c1558e4e482d52d31490959442f618a2d62&v=4)----------👥️

## 📌 Descripción
Este proyecto es una prueba de concepto (**POC**) para demostrar la implementación de **UseCases** en Flutter siguiendo una arquitectura modular.

Incluye dos implementaciones paralelas:
- Una versión clásica sin manejo de errores.
- Una versión moderna con **Either\<ErrorItem, R\>** para manejo de errores y diferenciación visual.

## 📂 Estructura del Proyecto
```text
lib
├── data
│   ├── gateways
│   │   ├── barcode_gateway_impl.dart
│   ├── repositories
│   │   ├── barcode_repository_impl.dart
│   │   ├── barcode_repository_failure_impl.dart
│
├── domain
│   ├── entities
│   │   ├── gateway.dart
│   │   ├── model.dart
│   │   ├── repository.dart
│   │   ├── state_manager.dart
│   │   ├── usecase.dart
│   │   ├── viewmodel.dart
│   │   ├── error_item.dart
│   │   ├── either.dart
│   ├── gateways
│   │   ├── barcode_gateway.dart
│   ├── repositories
│   │   ├── barcode_repository_interface.dart
│   ├── usecases
│   │   ├── get_barcodes_usecase.dart
│   │   ├── generate_new_barcodes_usecase.dart
│
├── viewmodels
│   ├── barcode_viewmodel.dart
│   ├── barcode_viewmodel_failure.dart
│
├── ui
│   ├── pages
│   │   ├── barcode_labels_page.dart
│   │   ├── barcode_labels_failure_page.dart
│   ├── widgets
│   │   ├── error_handler_widget.dart
│
├── mock_services
│   ├── mock_http_api.dart
│   ├── mock_socket_api.dart
│
├── main.dart
```

## 🚀 Cómo Ejecutar
```sh
flutter run
```

## 📖 Uso de Clases Principales

### 📌 `GetBarcodesUsecase`
```dart
final usecase = GetBarcodesUsecase(repository);
final barcodes = await usecase.execute();
```

### 📌 `BarcodeViewModel`
```dart
final viewModel = BarcodeViewModel(getBarcodesUseCase: usecase);
await viewModel.fetchBarcodes();
```

### 📌 `BarcodeViewModelFailure`
```dart
final failureVM = BarcodeViewModelFailure(repository: failureRepository);
await failureVM.fetchBarcodes();
```

### 📌 `BarcodeRepositoryFailureImpl`
```dart
final result = await repository.getBarcodes();
result.when(
  (error) => showError(error),
  (barcodes) => showList(barcodes),
);
```

### 📌 `ErrorHandlerWidget`
```dart
return ErrorHandlerWidget(
  viewModel: viewModelFailure,
  child: Scaffold(...),
);
```

## 📊 Demo Interactiva
Puedes modificar la **probabilidad de error** desde un Slider en la pantalla principal para simular distintos escenarios de red.

## 📄 Licencia
Este proyecto se encuentra bajo la licencia **MIT**.
