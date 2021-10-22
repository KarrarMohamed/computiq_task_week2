import 'package:flutter/material.dart';

class TemperatureHolderWidget extends StatelessWidget {
  final double temperature;

  const TemperatureHolderWidget({Key? key, required this.temperature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temperature.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9, left: 1),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        )
      ],
    );
  }
}
