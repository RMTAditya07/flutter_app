import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceInfoWidget extends StatelessWidget {
  final String icon;
  final String label;
  final String deviceNumber;
  final String deviceId;
  final MaterialColor backgroundColor;
  final Color iconColor;
  final Color deviceNumberColor;

  const DeviceInfoWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.deviceNumber,
    required this.deviceId,
    required this.backgroundColor,
    required this.iconColor,
    required this.deviceNumberColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 265,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9), // Use MaterialColor shade
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 14,
            height: 20,
            color: iconColor,
          ),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF808B9A),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                deviceNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            deviceId,
            style: TextStyle(
              color: Colors.grey[600], // Use MaterialColor shade
            ),
          ),
        ],
      ),
    );
  }
}
