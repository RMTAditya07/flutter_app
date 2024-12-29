import 'package:flutter/material.dart';
import 'package:mira2/widgets/DeviceInfoWidget.dart';

class ModalFooter extends StatelessWidget {
  final String backButtonText;
  final String proceedButtonText;
  final VoidCallback? onBackPressed;
  final VoidCallback? onProceedPressed;
  final Widget? leftWidget; // For custom content like DeviceInfoWidget

  const ModalFooter({
    super.key,
    this.backButtonText = 'Back',
    this.proceedButtonText = 'Proceed Anyway',
    this.onBackPressed,
    this.onProceedPressed,
    this.leftWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Optional Left Widget
        if (leftWidget != null) leftWidget!,
        if (leftWidget != null) const SizedBox(width: 16.0),

        // Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onBackPressed ?? () => Navigator.pop(context),
              child: Text(
                backButtonText,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFBCC3CC),
                  foregroundColor: Color(0xFF808B9A),
                  fixedSize: Size(124, 32)),
            ),
            const SizedBox(width: 16.0),
            TextButton(
              onPressed: onProceedPressed,
              child: Text(proceedButtonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  )),
              style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF01C7C5),
                  foregroundColor: Color(0xFFFFFFFF),
                  fixedSize: Size(124, 32)),
            ),
          ],
        ),
      ],
    );
  }
}
