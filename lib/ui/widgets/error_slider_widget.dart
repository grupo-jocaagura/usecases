import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../mock_services/mock_http_api.dart';

class ErrorSliderWidget extends StatefulWidget {
  const ErrorSliderWidget({super.key});

  @override
  State<ErrorSliderWidget> createState() => _ErrorSliderWidgetState();
}

class _ErrorSliderWidgetState extends State<ErrorSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          InlineTextWidget('Posibilidad de Error grave $errorChange 🐱‍👤'),
          Slider(
            label: '$errorChange 🐱‍👤',
            value: errorChange.toDouble(),
            max: 10,
            onChanged: (double value) {
              setState(() {
                errorChange = value.floor();
              });
            },
          ),
        ],
      ),
    );
  }
}
