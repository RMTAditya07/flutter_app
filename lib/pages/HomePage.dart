import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mira2/widgets/StepWidget.dart';
import 'package:mira2/widgets/DeviceInfoWidget.dart';
import 'package:mira2/widgets/ModalFooter.dart';
import 'package:mira2/utils/Responsive.dart';
import 'Step2Page.dart'; // Import Step 2 page

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentStep = 1; // Track the current step
  final Map<int, bool> stepCompletionStatus = {
    1: false, // Step 1 starts as incomplete
    2: false, // Step 2 is incomplete initially
    3: false,
    4: false,
  };

  void goToNextStep() {
    setState(() {
      stepCompletionStatus[currentStep] = true; 
      currentStep = 2; // Move to Step 2
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Step2Page()),
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
    final isTablet = Responsive.isTablet(context);
    final modalHeightFactor = isTablet ? 0.7 : 0.8;
    final List<Map<String, dynamic>> stepData = [
      {'index': 1, 'title': 'STEP 1', 'description': 'Remove Device'},
      {'index': 2, 'title': 'STEP 2', 'description': 'Review re-allotment'},
      {'index': 3, 'title': 'STEP 3', 'description': 'Confirm re-allotment'},
      {'index': 4, 'title': 'STEP 4', 'description': 'What next'},
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          // insetPadding: EdgeInsets.symmetric(
          //   vertical: MediaQuery.of(context).size.height *
          //       (1 - modalHeightFactor) /
          //       2,
          //   horizontal:
          //       MediaQuery.of(context).size.width * (isTablet ? 0.15 : 0.05),
          // ),
          child: Container(
            // height: MediaQuery.of(context).size.height * modalHeightFactor,
            height: 465,
            width: 750,
            padding: EdgeInsets.all(isTablet ? 18.0 : 16.0),
            child: Column(
              children: [
                // Header Section (Custom Specs)
                Container(
                  width: double.infinity,
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
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),

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
                                  isCompleted: stepCompletionStatus[step['index']] ?? false,
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
                            // height: 258,
                            width: 336,
                            // margin: const EdgeInsets.only(left: 16.0),
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Color(0xFFCFE1E1)),
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // width: 304,
                                      height: 24,
                                      // padding: EdgeInsets.symmetric(
                                      //     horizontal:
                                      //         16.0), // Optional: Add some padding
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Remove Device '4'?",
                                            style: TextStyle(
                                              fontSize: isTablet ? 20.0 : 16.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            'assets/images/info.svg',
                                            height: 24,
                                            width: 24,
                                            // color: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Container(
                                      // width: 304,
                                      height: 63,
                                      child: Text(
                                        'Device 4 has un-synced student data. To avoid '
                                        'data loss, connect it to the internet, sync the '
                                        'data, and then proceed.',
                                        style: TextStyle(
                                          fontSize: isTablet ? 14.0 : 12.0,
                                          color: Color(0xFF808B9A),
                                          fontWeight: FontWeight.w500,
                                          // height: 3,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Center(
                                      child: DeviceInfoWidget(
                                        icon: 'assets/images/Phone.svg',
                                        label: 'DEVICE',
                                        deviceNumber: '4',
                                        deviceId: 'D 9 4 L S 9',
                                        backgroundColor: Colors.grey,
                                        iconColor: Color(0xFFB67EFC),
                                        deviceNumberColor: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                    fontSize: 14,
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
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
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

                // Footer Section (Custom Specs) - Use Expanded to fill remaining space
                Container(
                  width: double.infinity,
                  height: 64.0,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0),
                    ),
                    color: Colors.white,
                  ),
                  child: ModalFooter(
                    backButtonText: 'Back',
                    proceedButtonText: 'Proceed Anyway',
                    onBackPressed: () {
                      Navigator.pop(context);
                    },
                    onProceedPressed: () {
                      goToNextStep(); // Go to the next step
                    },
                    leftWidget: DeviceInfoWidget(
                      icon: 'assets/images/Phone.svg', // Path to your SVG file
                      label: 'THIS DEVICE',
                      deviceNumber: '3',
                      deviceId: 'H S 9 3 L W',
                      backgroundColor: Colors.grey,
                      iconColor: Color(0xFF48A2DF),
                      deviceNumberColor: Color(0xFF48A2DF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
