// models/device_data.dart
import 'package:flutter/material.dart';

class DeviceData {
  final int number;
  final String icon;
  final String label;
  final String deviceNumber;
  final String deviceId;
  final Color backgroundColor;
  final Color iconColor;
  final Color deviceNumberColor;

  DeviceData({
    required this.number,
    required this.icon,
    required this.label,
    required this.deviceNumber,
    required this.deviceId,
    required this.backgroundColor,
    required this.iconColor,
    required this.deviceNumberColor,
  });
}
