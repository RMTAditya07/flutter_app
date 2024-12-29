import 'package:flutter/material.dart';

class DeviceAllotment extends StatelessWidget {
  final int number; // Dynamic number on the left
  final Widget deviceWidget; // Device info widget on the right

  const DeviceAllotment({
    Key? key,
    required this.number,
    required this.deviceWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread out items
      children: [
        Row(
          children: [
            Text(
              number.toString(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4.0),
            const Icon(
              Icons.person, // Human icon
              size: 20.0,
            ),
            const SizedBox(width: 4.0),
            const Icon(
              Icons.arrow_forward_ios, // Angular arrow
              size: 16.0,
            ),
          ],
        ),
        // Device Information Widget
        deviceWidget,
      ],
    );
  }
}