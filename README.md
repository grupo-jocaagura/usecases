# UseCases Demo
    ![Coverage](https://img.shields.io/badge/coverage-99%25-brightgreen)
    ![Coverage](https://img.shields.io/badge/Author-@albertjjimenezp-brightgreen)
    -------------------------------![Author](https://avatars.githubusercontent.com/u/35118534?s=200&u=80708c1558e4e482d52d31490959442f618a2d62&v=4)----------🐱‍👤

    ## 📌 Descripción
    Este proyecto es una prueba de concepto (**POC**) para demostrar la implementación de **UseCases** en Flutter siguiendo una arquitectura modular.

    ## 📂 Estructura del Proyecto
    ```
    lib
    ├── data
    │   ├── gateways
    │   │   ├── barcode_gateway_impl.dart
    │   ├── repositories
    │   │   ├── barcode_repository_impl.dart
    │
    ├── domain
    │   ├── entities
    │   │   ├── gateway.dart
    │   │   ├── model.dart
    │   │   ├── repository.dart
    │   │   ├── state_manager.dart
    │   │   ├── usecase.dart
    │   │   ├── viewmodel.dart
    │   ├── usecases
    │   │   ├── get_barcodes_usecase.dart
    │
    ├── viewmodels
    │   ├── barcode_viewmodel.dart
    │
    ├── ui
    │   ├── pages
    │   ├── providers
    │   ├── widgets
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

    ### 📌 `BarcodeRepositoryImpl`
    ```dart
    final repository = BarcodeRepositoryImpl(gateway: BarcodeGatewayImpl());
    final barcodes = await repository.getBarcodes();
    ```

    ## 📄 Licencia
    Este proyecto se encuentra bajo la licencia **MIT**.
 