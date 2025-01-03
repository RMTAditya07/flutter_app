  import 'package:flutter/material.dart';
  import 'package:mira2/widgets/DeviceInfoWidget.dart';

  class ModalFooter extends StatelessWidget {
    final String backButtonText;
    final String proceedButtonText;
    final VoidCallback? onBackPressed;
    final VoidCallback? onProceedPressed;
    final Widget? leftWidget; // For custom content like DeviceInfoWidget
    final double buttonWidth;

    const ModalFooter({
      super.key,
      this.backButtonText = 'Back',
      this.proceedButtonText = 'Proceed Anyway',
      this.onBackPressed,
      this.onProceedPressed,
      this.leftWidget,
      this.buttonWidth = 120.0,
    });

    @override
    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Optional Left Widget
          if (leftWidget != null) leftWidget!,
          if (leftWidget != null) const SizedBox(width: 16.0),
     Spacer(),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (onBackPressed != null)
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
                    fixedSize: Size(buttonWidth, 32)),
              ),
              if (onBackPressed != null) const SizedBox(width: 16.0),
              Container(
                margin: const EdgeInsets.only(right: 12.0),
                child: TextButton(
                  onPressed: onProceedPressed,
                  child: Text(proceedButtonText,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      )),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF01C7C5),
                      foregroundColor: Color(0xFFFFFFFF),
                      fixedSize: Size(buttonWidth, 32)),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
