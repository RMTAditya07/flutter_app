import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira2/widgets/StepWidget.dart';
import 'package:mira2/widgets/DeviceInfoWidget.dart';
import 'package:mira2/widgets/ModalFooter.dart';
import 'package:mira2/pages/Step4Page.dart';
import 'package:mira2/utils/Responsive.dart';

class Step3Page extends StatefulWidget {
  const Step3Page({super.key});

  @override
  _Step3PageState createState() => _Step3PageState();
}

class _Step3PageState extends State<Step3Page> {
  int currentStep = 3; // Track the current step
  final Map<int, bool> stepCompletionStatus = {
    1: true, // Step 1 is completed initially
    2: true, // Step 2 is completed
    3: false, // Step 3 is active but not completed
    4: false, // Step 4 is not completed
  };
  void goToNextStep() {
    setState(() {
      stepCompletionStatus[currentStep] = true;
      currentStep = 4; // Move to Step 2
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Step4Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final List<Map<String, dynamic>> stepData = [
      {'index': 1, 'title': 'STEP 1', 'description': 'Remove Device'},
      {'index': 2, 'title': 'STEP 2', 'description': 'Review re-allotment'},
      {'index': 3, 'title': 'STEP 3', 'description': 'Confirm re-allotment'},
      {'index': 4, 'title': 'STEP 4', 'description': 'What next'},
    ];
    return Dialog(
      // insetPadding: const EdgeInsets.symmetric(
      //   vertical: 50.0,
      //   horizontal: 100.0,
      // ),
      child: Container(
        width: 686,
        height: 460,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 56.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                color: Colors.white,
                // color: Colors.yellow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remove Device '4'",
                    style: TextStyle(
                      fontSize: isTablet ? 16.0 : 14.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF18181C),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            // Modal Body
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                // color: Colors.red,
                color: Colors.white,
                child: Row(
                  children: [
                    // Breadcrumb Section (40%)
                    Expanded(
                      flex: isTablet ? 3 : 4,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        width: 226,
                        // color: Colors.blue,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: stepData.map((step) {
                            return StepWidget(
                              step['title'],
                              step['description'],
                              isActive: step['index'] == currentStep,
                              isCompleted:
                                  stepCompletionStatus[step['index']] ?? false,
                              isLast: step['index'] == stepData.length,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 36,
                    ),
                    // Curved Box Section (60%)
                    Expanded(
                      flex: isTablet ? 7 : 6,
                      child: Container(
                        width: 336,
                        height: 292,
                        margin: const EdgeInsets.only(left: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Color(0xFFCFE1E1)),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Confirm student re-allotment?',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Students from device 4 will be re-alloted to other devices automatically. Un-synced student data on device 4 will be lost.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF18181C),
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Center(
                                  child: DeviceInfoWidget(
                                    icon: 'assets/images/Phone.svg',
                                    label: 'DEVICE ID',
                                    deviceNumber: '4',
                                    deviceId: '9 6 J S P 0',
                                    backgroundColor: Color(0xFFF8FAFC),
                                    iconColor: Color(0xFFB67EFC),
                                    deviceNumberColor: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.warning_rounded,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              '62',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(width: 4.0),
                                            SvgPicture.asset("assets/images/human.svg",height: 16.0,width: 16.0,
                                              color: Colors.black,),
                                            const SizedBox(width: 8.0),
                                            const Text(
                                              'Last synced on',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4.0),
                                        const Text(
                                          '21 Oct, 2024 @ 12:05 PM',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Note* ', // "Note*" in red
                                        style: TextStyle(
                                          color: Colors
                                              .red, // Red color for "Note*"
                                          fontWeight: FontWeight
                                              .bold, // Optional bold style
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "Don't use device going forward", // Remaining text in black
                                        style: TextStyle(
                                          color: Colors
                                              .black, // Black color for the rest of the text
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Footer Section
            Container(
              color: Colors.white,
              child: ModalFooter(
                backButtonText: 'Back',
                proceedButtonText: 'Remove & Re-allot',
                onBackPressed: () {
                  Navigator.pop(context);
                },
                onProceedPressed: () {
                  goToNextStep(); // Go to the next step
                },
                buttonWidth: 135.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
