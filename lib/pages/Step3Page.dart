import 'package:flutter/material.dart';
import 'package:mira2/widgets/StepWidget.dart';
import 'package:mira2/widgets/DeviceInfoWidget.dart';
import 'package:mira2/widgets/ModalFooter.dart';
import 'package:mira2/pages/Step4Page.dart';

class Step3Page extends StatefulWidget {
  const Step3Page({super.key});

  @override
  _Step3PageState createState() => _Step3PageState();
}

class _Step3PageState extends State<Step3Page> {
  int currentStep = 3; // Track the current step

  void goToNextStep() {
    setState(() {
      currentStep = 4; // Move to Step 2
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Step4Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tablet Modal UI'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showModal(context),
          child: const Text('Open Modal'),
        ),
      ),
    );
  }

  void _showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 100.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Remove Device “4”',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),

                // Modal Body
                Row(
                  children: [
                    // Breadcrumb Section (40%)
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StepWidget('STEP 1', 'Remove Device',
                              isActive: currentStep == 1,
                              isLast: false,
                              isCompleted: true),
                          StepWidget('STEP 2', 'Review re-allotment',
                              isActive: currentStep == 2,
                              isLast: false,
                              isCompleted: true),
                          StepWidget(
                            'STEP 3',
                            'Confirm re-allotment',
                            isActive: currentStep == 3,
                            isLast: false,
                          ),
                          StepWidget(
                            'STEP 4',
                            'What next',
                            isActive: currentStep == 4,
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                    // Curved Box Section (60%)
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Confirm student re-allotment?',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                const Text(
                                  'Students from device 4 will be re-alloted to other devices automatically. Un-synced student data on device 4 will be lost.',
                                ),
                                const SizedBox(height: 16.0),
                                DeviceInfoWidget(
                                  icon: 'assets/images/Phone.svg',
                                  label: 'DEVICE',
                                  deviceNumber: '4',
                                  deviceId: '9 6 J S P 0',
                                  backgroundColor: Colors.grey,
                                  iconColor: Colors.purple,
                                  deviceNumberColor: Colors.white,
                                ),
                                const SizedBox(height: 8.0),
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
                                            const Icon(
                                              Icons.person,
                                              size: 16.0,
                                              color: Colors.black,
                                            ),
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

                // Footer Section
                ModalFooter(
                  backButtonText: 'Back',
                  proceedButtonText: 'Remove & Re-allot',
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  onProceedPressed: () {
                    goToNextStep(); // Go to the next step
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
