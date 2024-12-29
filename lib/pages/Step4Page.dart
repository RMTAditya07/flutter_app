import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira2/widgets/DeviceInfoWidget.dart';
import 'package:mira2/widgets/StepWidget.dart';

class Step4Page extends StatelessWidget {
  const Step4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        vertical:
            MediaQuery.of(context).size.height * 0.05, // 5% vertical margin
        horizontal:
            MediaQuery.of(context).size.width * 0.15, // 15% horizontal margin
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Remove Device \'4\'',
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

            // Step Tracker Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StepWidget('STEP 1', 'Remove Device',
                          isActive: false, isCompleted: true),
                      StepWidget('STEP 2', 'Review re-allotment',
                          isActive: false, isCompleted: true),
                      StepWidget('STEP 3', 'Confirm re-allotment',
                          isActive: false, isCompleted: true),
                      StepWidget(
                        'STEP 4',
                        'What next',
                        isActive: true,
                        isCompleted: false,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: const Text(
                          'Hooray',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Center(
                        child: const Text(
                          'Device 4 has been removed and 62 students have been re-allotted successfully',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/success_banner.svg', // Path to your SVG file
                          width: 100, // Set desired width
                          height: 100, // Set desired height
                        ),
                      ),

                      const SizedBox(height: 16.0),

                      // Re-allotment Devices Section
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DeviceReallotmentRow(
                              fromDevice: DeviceInfoWidget(
                                icon: 'assets/images/Phone.svg',
                                label: 'DEVICE',
                                deviceNumber: '4',
                                deviceId: 'D 9 4 L S 9',
                                backgroundColor: Colors.grey,
                                iconColor: Colors.purple,
                                deviceNumberColor: Colors.blue,
                              ),
                              toDevices: [
                                DeviceInfoWidget(
                                  icon: 'assets/images/Phone.svg',
                                  label: 'DEVICE',
                                  deviceNumber: '1',
                                  deviceId: 'D K S O S 7',
                                  backgroundColor: Colors.grey,
                                  iconColor: Colors.purple,
                                  deviceNumberColor: Colors.blue,
                                ),
                                DeviceInfoWidget(
                                  icon: 'assets/images/Phone.svg',
                                  label: 'DEVICE',
                                  deviceNumber: '2',
                                  deviceId: 'S 7 O I W L',
                                  backgroundColor: Colors.grey,
                                  iconColor: Colors.orange,
                                  deviceNumberColor: Colors.blue,
                                ),
                                DeviceInfoWidget(
                                  icon: 'assets/images/Phone.svg',
                                  label: 'DEVICE',
                                  deviceNumber: '3',
                                  deviceId: '0 S L W 8 H',
                                  backgroundColor: Colors.grey,
                                  iconColor: Colors.blue,
                                  deviceNumberColor: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16.0),

                      // Next Steps Section
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'What next?',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '• Log in ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: 'to each device\n'),
                                  TextSpan(
                                    text: '• Connect ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: 'it to the internet\n'),
                                  TextSpan(
                                    text: '• Sync ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text:
                                          'student data for continued offline use\n'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // Footer Section
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Done'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Device Re-allotment Row
class DeviceReallotmentRow extends StatelessWidget {
  final DeviceInfoWidget fromDevice;
  final List<DeviceInfoWidget> toDevices;

  const DeviceReallotmentRow({
    Key? key,
    required this.fromDevice,
    required this.toDevices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: fromDevice,
        ),
        const Icon(Icons.arrow_forward, color: Colors.grey),
        Expanded(
          child: Column(
            children: toDevices,
          ),
        ),
      ],
    );
  }
}
