import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Container(
      // width: 304,
      // height: 50,
        margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
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
              SvgPicture.asset(
                'assets/images/human.svg',
                width: 16.0,
                height: 16.0,
              ),
              const SizedBox(width: 12.0),
              SvgPicture.asset(
                'assets/images/arrow.svg',
                width: 24.0,
                height: 24.0,
              ),
            ],
          ),
          // Device Information Widget
          deviceWidget,
        ],
      ),
    );
  }
}