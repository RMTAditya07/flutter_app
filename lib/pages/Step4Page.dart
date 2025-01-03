import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira2/utils/Responsive.dart';
import 'package:mira2/widgets/DeviceInfoWidget.dart';
import 'package:mira2/widgets/ModalFooter.dart';
import 'package:mira2/widgets/StepWidget.dart';
import 'package:mira2/models/device_data.dart';


class Step4Page extends StatelessWidget {
  const Step4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final isTablet = Responsive.isTablet(context);
     int currentStep = 4; // Track the current step
  final Map<int, bool> stepCompletionStatus = {
    1: true, // Step 1 is completed initially
    2: true, // Step 2 is completed
    3: true, // Step 3 is active but not completed
    4: false, // Step 4 is not completed
  };
    final List<Map<String, dynamic>> stepData = [
      {'index': 1, 'title': 'STEP 1', 'description': 'Remove Device'},
      {'index': 2, 'title': 'STEP 2', 'description': 'Review re-allotment'},
      {'index': 3, 'title': 'STEP 3', 'description': 'Confirm re-allotment'},
      {'index': 4, 'title': 'STEP 4', 'description': 'What next'},
    ];

    final List<DeviceData> deviceDataList = [
      DeviceData(
          number: 4, // Dynamic number
        
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '1',
            deviceId: 'D K S O S 7',
            backgroundColor: Colors.grey,
            iconColor: Color(0xFFB67EFC),
            deviceNumberColor: Colors.blue,
          ),
        
        DeviceData(
          number: 4, // Dynamic number
         
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '2',
            deviceId: 'S 7 O I W L',
            backgroundColor: Colors.grey,
            iconColor: Color(0xFFF88A56),
            deviceNumberColor: Colors.blue,
          ),
        
        DeviceData(
          number: 4, // Dynamic number
       
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '3',
            deviceId: '0 S L W 8 H',
            backgroundColor: Color(0xFFF1F5F9),
            iconColor: Color(0xFF48A2DF),
            deviceNumberColor: Colors.blue,
          ),
        
        
    ];

    return Dialog(
      // insetPadding: EdgeInsets.symmetric(
      //   vertical:
      //       MediaQuery.of(context).size.height * 0.05, // 5% vertical margin
      //   horizontal:
      //       MediaQuery.of(context).size.width * 0.15, // 15% horizontal margin
      // ),

      // backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: 820,
        height: 750,
        // color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            // Step Tracker Section
            Container(
              width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    // color: Colors.red,
                    color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                        flex: isTablet ? 3 : 4,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 206,
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
                      const SizedBox(width: 36.0),
                  Expanded(
                    flex: isTablet ? 7 : 6,
                    child: Container(
                      color: Colors.white,
                      width: 530,
                      height: 572,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: [
                          Center(
                            child: const Text(
                              'Hooray',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Center(
                            
                            child: Container(
                              width: 311,
                              height: 42,
                              child: const Text(
                                'Device 4 has been removed and 62 students have been re-allotted successfully',
                                  textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xFF18181C),
                                  fontWeight: FontWeight.w500,
                                ),
                                
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
                      
                          const SizedBox(height: 8.0),
                      
                          // Re-allotment Devices Section
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: 530,
                            height: 190,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFFF1F5F9),
                              ),
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
                                  toDevices: buildDeviceInfoWidgets(deviceDataList),
                                ),
                              ],
                            ),
                          ),
                      
                          const SizedBox(height: 8.0),
                      
                          // Next Steps Section
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: 530,
                            height: 144,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F2FF),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/info_purple.svg',
                                      width: 24.0,
                                      height: 24.0,
                                     
                                    ),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      'What next?',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFB67EFC),
                                      ),
                                    ),
                                  ],
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
                  ),
                ],
              ),
            ),

            // Footer Section
            Container(
                  color: Colors.white,
                  child: ModalFooter(
                    proceedButtonText: 'Done',
                    
                  ),
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
            children: toDevices
                .map((device) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: device,
                    ))
                .toList(),
            
          ),
        ),
      ],
    );
  }
}

List<DeviceInfoWidget> buildDeviceInfoWidgets(List<DeviceData> devices) {
  return devices
      .map(
        (device) => DeviceInfoWidget(
          icon: device.icon,
          label: device.label,
          deviceNumber: device.deviceNumber,
          deviceId: device.deviceId,
          backgroundColor: device.backgroundColor,
          iconColor: device.iconColor,
          deviceNumberColor: device.deviceNumberColor,
        ),
      )
      .toList();
}
