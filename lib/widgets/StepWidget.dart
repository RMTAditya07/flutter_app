import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepWidget extends StatelessWidget {
  final String step;
  final String label;
  final bool isActive;
  final bool isCompleted;
  final bool isLast;

  const StepWidget(this.step, this.label,
      {this.isActive = false,
      this.isLast = false,
      this.isCompleted = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Circle and Line
        Column(
          children: [
            // Circle
            Stack(
              alignment: Alignment.center,
              children: [
                if (isCompleted)
                  Container(
                    width: 30.0,
                    height: 30.0,
                    child: SvgPicture.asset('assets/images/success_icon.svg'),
                  ),
                if (isActive)
                  Container(
                    width: 30.0,
                    height: 30.0,
                    child:
                        SvgPicture.asset('assets/images/inprogress_icon.svg'),
                  ),
                if (!isActive && !isCompleted)
                  Container(
                    width: 30.0,
                    height: 30.0,
                    child: SvgPicture.asset('assets/images/inactive.svg'),
                  ),
              ],
            ),
            // Vertical Line
            if (!isLast && !isCompleted)
              Container(
                width: 2.0,
                // height: 40.0,
                child: SvgPicture.asset(
                  'assets/images/inprogress.svg',
                  height: 36,
                  // color: Colors.red,
                ),
              ),
            if (isCompleted)
              Container(
                width: 2.0,
                height: 36.0,
                child: SvgPicture.asset(
                  'assets/images/success_line.svg',
                  height: 36,
                ),
              ),
          ],
        ),
        const SizedBox(width: 24.0),
        // Step Label and Text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              step,
              style: TextStyle(
                color: Color(0xFF808B9A),
                fontWeight: FontWeight.w600,
                fontSize: 10.0,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: isActive || isCompleted
                    ? Color(0xFF18181C)
                    : Color(0xFF808B9A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
