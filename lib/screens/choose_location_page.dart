import 'package:flutter/material.dart';

import 'package:intrapair_mobile_apt_test/screens/select_country_page.dart';

class ChooseLocationPage extends StatefulWidget {
  String initialCountry;
  String initialFlag;
  ChooseLocationPage(
      {super.key, required this.initialCountry, required this.initialFlag});

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsiveHeight = MediaQuery.of(context).size.height;
    final responsiveWidth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: responsiveHeight * 0.08,
              ),

              // Location icon
              Container(
                height: responsiveHeight * 0.15,
                width: responsiveWidth * 0.15,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/location_icon.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: responsiveHeight * 0.028,
              ),

              // Text Choose your country

              Text(
                'Choose Your Country',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: responsiveWidth * 0.03,
                    color: Colors.black),
              ),
              SizedBox(
                height: responsiveHeight * 0.018,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: responsiveWidth * 0.02),
                child: Text(
                  'Please select your country to help us give you a better experience',
                  style: TextStyle(
                      fontSize: responsiveWidth * 0.02, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(
                height: responsiveHeight * 0.055,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SelectCountryPage())));
                },
                child: Container(
                  height: responsiveHeight * 0.07,
                  width: responsiveWidth * 0.46,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xFFE1E1E1),
                            blurRadius: 6,
                            spreadRadius: 1)
                      ],
                      border: Border.all(color: const Color(0xFFC9C9C9)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            widget.initialFlag == ''
                                ? const Text('')
                                : Image.network(
                                    widget.initialFlag,
                                    width: responsiveWidth * 0.03,
                                    height: responsiveHeight * 0.03,
                                  ),
                            SizedBox(
                              width: responsiveWidth * 0.04,
                            ),
                            Text(
                              widget.initialCountry == "Select Country"
                                  ? 'Select Country '
                                  : widget.initialCountry,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: responsiveWidth * 0.025),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: responsiveHeight * 0.27,
              ),

              // Go ahead button

              Container(
                width: responsiveWidth * 0.45,
                height: responsiveHeight * 0.065,
                decoration: BoxDecoration(
                    border: widget.initialCountry == 'Select Country'
                        ? Border.all(color: const Color(0xFFDCDEDD))
                        : null,
                    borderRadius: BorderRadius.circular(8),
                    color: widget.initialCountry == 'Select Country'
                        ? Colors.white
                        : const Color(0xFF273D28)),
                child: Center(
                    child: Text(
                  'Go ahead',
                  style: TextStyle(
                      color: widget.initialCountry == 'Select Country'
                          ? Colors.black
                          : Colors.white,
                      fontSize: responsiveWidth * 0.021),
                )),
              ),

              SizedBox(
                height: responsiveHeight * 0.05,
              ),
              //  Continue with another Gmail

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/google_logo.png',
                    width: responsiveWidth * 0.03,
                    height: responsiveHeight * 0.03,
                  ),
                  SizedBox(width: responsiveWidth * 0.02),
                  const Text(
                    'Continue with another Gmail',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
