import 'package:flutter/material.dart';
import 'package:mira2/pages/HomePage.dart'; // Import Step 1 page
import 'package:mira2/pages/Step3Page.dart';
import 'package:mira2/widgets/ModalFooter.dart'; // Import Step 1 page
import 'package:mira2/widgets/StepWidget.dart'; // Import Step 1 page
import 'package:mira2/widgets/DeviceInfoWidget.dart'; // Import Step 1 page
import 'package:mira2/widgets/DeviceAllotment.dart'; // Import Step 1 page

class Step2Page extends StatefulWidget {
  const Step2Page({super.key});

  @override
  _Step2PageState createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  int currentStep = 2; // Track the current step

  void goToNextStep() {
    setState(() {
      currentStep = 3; // Move to Step 2
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Step3Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-allotment Devices'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showStep2Modal(context),
          child: const Text('Open Step 2 Modal'),
        ),
      ),
    );
  }

  void _showStep2Modal(BuildContext context) {
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

                // Modal Body (Similar to Step 1)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Breadcrumb Section (40%)
                    const Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Step 1 is completed, so it is green
                          StepWidget('STEP 1', 'Remove Device',
                              isActive: false, isCompleted: true),
                          // Step 2 is active, so it is purple
                          StepWidget('STEP 2', 'Review re-allotment',
                              isActive: true),
                          // Step 3 and Step 4 are inactive
                          StepWidget('STEP 3', 'Confirm re-allotment'),
                          StepWidget('STEP 4', 'What next', isLast: true),
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
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.info_rounded),
                                onPressed: () {},
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green, // Human icon
                                      size: 20.0,
                                    ),
                                    const Text(
                                      'Re-allotment Devices',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                const Text(
                                  'Students from device 4 will be re-allotted to the following mapped devices.',
                                ),
                                const SizedBox(height: 16.0),
                                // Example Device Info for Re-allotment
                                _buildReAllotmentDevices(),
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
                  proceedButtonText: 'Next',
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  onProceedPressed: () {
                    goToNextStep();
                    // Handle proceed to next step
                    // Navigate to Step 3 or final confirmation if needed
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Example function to list devices for re-allotment
  Widget _buildReAllotmentDevices() {
    return Column(
      children: [
        DeviceAllotment(
          number: 4, // Dynamic number
          deviceWidget: DeviceInfoWidget(
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '1',
            deviceId: 'D K S O S 7',
            backgroundColor: Colors.grey,
            iconColor: Colors.purple,
            deviceNumberColor: Colors.blue,
          ),
        ),
        DeviceAllotment(
          number: 4, // Dynamic number
          deviceWidget: DeviceInfoWidget(
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '2',
            deviceId: 'S 7 O I W L',
            backgroundColor: Colors.grey,
            iconColor: Colors.orange,
            deviceNumberColor: Colors.blue,
          ),
        ),
        DeviceAllotment(
          number: 4, // Dynamic number
          deviceWidget: DeviceInfoWidget(
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '2',
            deviceId: '0 S L W 8 H',
            backgroundColor: Colors.grey,
            iconColor: Colors.blue,
            deviceNumberColor: Colors.blue,
          ),
        ),
        DeviceAllotment(
          number: 7, // Dynamic number
          deviceWidget: DeviceInfoWidget(
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '5',
            deviceId: 'L 0 3 M S 7',
            backgroundColor: Colors.grey,
            iconColor: Colors.purple,
            deviceNumberColor: Colors.blue,
          ),
        ),
        DeviceAllotment(
          number: 5, // Dynamic number
          deviceWidget: DeviceInfoWidget(
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '6',
            deviceId: '0 S L W 8 H',
            backgroundColor: Colors.grey,
            iconColor: Colors.orange,
            deviceNumberColor: Colors.blue,
          ),
        ),
        DeviceAllotment(
          number: 3, // Dynamic number
          deviceWidget: DeviceInfoWidget(
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '7',
            deviceId: 'S 3 L S P S',
            backgroundColor: Colors.grey,
            iconColor: Colors.blue,
            deviceNumberColor: Colors.blue,
          ),
        ),
        DeviceAllotment(
          number: 2, // Dynamic number
          deviceWidget: DeviceInfoWidget(
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '8',
            deviceId: 'D 4 8 D S A',
            backgroundColor: Colors.grey,
            iconColor: Colors.green,
            deviceNumberColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
