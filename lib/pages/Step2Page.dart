import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira2/pages/HomePage.dart'; // Import Step 1 page
import 'package:mira2/pages/Step3Page.dart';
import 'package:mira2/widgets/ModalFooter.dart'; // Import Step 1 page
import 'package:mira2/widgets/StepWidget.dart'; // Import Step 1 page
import 'package:mira2/widgets/DeviceInfoWidget.dart'; // Import Step 1 page
import 'package:mira2/widgets/DeviceAllotment.dart'; // Import Step 1 page
import 'package:mira2/utils/Responsive.dart';
import 'package:mira2/models/device_data.dart';


class Step2Page extends StatefulWidget {
  const Step2Page({super.key});

  @override
  _Step2PageState createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  int currentStep = 2; // Track the current step
  final Map<int, bool> stepCompletionStatus = {
    1: true, // Step 1 is completed initially
    2: false, // Step 2 is active but not completed
    3: false, // Step 3 is not completed
    4: false, // Step 4 is not completed
  };
  void goToNextStep() {
    setState(() {
      stepCompletionStatus[currentStep] = true;

      currentStep = 3; // Move to Step 2
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Step3Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final modalHeightFactor = isTablet ? 0.7 : 0.8;
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
        
        DeviceData(
          number: 7, // Dynamic number
        
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '5',
            deviceId: 'L 0 3 M S 7',
            backgroundColor: Color(0xFFF1F5F9),
            iconColor: Color(0xFFB67EFC),
            deviceNumberColor: Colors.blue,
          ),
        
        DeviceData(
          number: 5, // Dynamic number
       
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '6',
            deviceId: '0 S L W 8 H',
            backgroundColor: Color(0xFFF1F5F9),
            iconColor: Color(0xFFF88A56),
            deviceNumberColor: Colors.blue,
          ),
        
        DeviceData(
          number: 3, // Dynamic number
       
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '7',
            deviceId: 'S 3 L S P S',
            backgroundColor: Color(0xFFF1F5F9),
            iconColor: Color(0xFF48A2DF),
            deviceNumberColor: Colors.blue,
          ),
        
        DeviceData(
          number: 2, // Dynamic number
     
            icon: 'assets/images/Phone.svg',
            label: 'DEVICE',
            deviceNumber: '8',
            deviceId: 'D 4 8 D S A',
            backgroundColor: Color(0xFFF1F5F9),
            iconColor: Color(0xFF35B869),
            deviceNumberColor: Colors.blue,
          ),
      
    ];
    return Dialog(
          // insetPadding: const EdgeInsets.symmetric(
          //   vertical: 50.0,
          //   horizontal: 100.0,
          // ),
          child: Container(
            width: 658,
            height: 688,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modal Header
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
                // Body Section (Custom Specs) - Using Expanded to take up remaining space
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    // color: Colors.red,
                    color: Colors.white,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Breadcrumb Section (Responsive Flex)
                        Expanded(
                          flex: isTablet ? 3 : 4,
                          child: Container(
                            // padding: const EdgeInsets.all(24.0),
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
                                      stepCompletionStatus[step['index']] ??
                                          false,
                                  isLast: step['index'] == stepData.length,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        // Curved Box Section (Responsive Flex)
                        const SizedBox(
                          width: 36,
                        ),
                        Expanded(
                          flex: isTablet ? 7 : 6,
                          child: Container(
                            width: 338,
                            height: 520,
                            // color: Colors.red,
                            
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color:  const Color(0xFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Color(0xFFCFE1E1)),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SvgPicture.asset("assets/images/info.svg")
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.check_circle,
                                          color: Colors.green, // Human icon
                                          size: 20.0,
                                        ),
                                        const SizedBox(width: 8.0),
                                        const Text(
                                          'Re-allotment Devices',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Container(
                                      height: 42,
                                      width: 282,
                                      child: const Text(
                                        'Students from device 4 will be re-allotted to the following mapped devices.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0,
                                          color: Color(0xFF808B9A),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    _buildReAllotmentDevices(deviceDataList),
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
                    proceedButtonText: 'Next',
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                    onProceedPressed: () {
                      goToNextStep();
                    },
                  ),
                ),
              ],
            ),
          ),
          );
  }
Widget _buildReAllotmentDevices(List<DeviceData> devices) {
  return Column(
    children: devices.map((device) {
      return DeviceAllotment(
        number: device.number,
        deviceWidget: DeviceInfoWidget(
          icon: device.icon,
          label: device.label,
          deviceNumber: device.deviceNumber,
          deviceId: device.deviceId,
          backgroundColor: device.backgroundColor,
          iconColor: device.iconColor,
          deviceNumberColor: device.deviceNumberColor,
        ),
      );
    }).toList(),
  );
}
}