import 'package:flutter/material.dart';
import 'package:intrapair_mobile_apt_test/components/list_tile.dart';
import 'package:intrapair_mobile_apt_test/models/country_model.dart';
import 'package:intrapair_mobile_apt_test/screens/choose_location_page.dart';
import 'package:intrapair_mobile_apt_test/services/country_services.dart';

class SelectCountryPage extends StatefulWidget {
  const SelectCountryPage({
    super.key,
  });

  @override
  State<SelectCountryPage> createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  @override
  void initState() {
    getAllCountries();

    super.initState();
  }

  Future<void> getAllCountries() async {
    isLoading = true;
    final response = await CountryService().getCountries();
    setState(() {
      countries = response;
      foundCountries = countries;
      isLoading = false;
    });
  }

  List<Countres> foundCountries = [];

  List<Countres> countries = [];

// initializing variables
  String selectedCountry = '';
  String finalFlag = '';
  bool isLoading = false;

  // filter function
  void runFilter(String enteredKeyword) {
    List<Countres> results = [];
    if (enteredKeyword.isEmpty) {
      results = countries;
    } else {
      results = countries
          .where((country) => country.country
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundCountries = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsiveHeight = MediaQuery.of(context).size.height;
    final responsiveWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: responsiveHeight * 0.05,
          left: responsiveHeight * 0.02,
          right: responsiveHeight * 0.02,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Label Select Country

                Text(
                  'Select Country',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveWidth * 0.03),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            SizedBox(
              height: responsiveHeight * 0.03,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 232, 232, 232)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: responsiveWidth * 0.01,
                          left: responsiveWidth * 0.01),
                      child: const Icon(Icons.search),
                    ),

                    // search container
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextFormField(
                        onChanged: (value) => runFilter(value),
                        decoration:
                            const InputDecoration(hintText: 'Search Country'),
                      ),
                    )),
                  ],
                )),
            isLoading
                ? Padding(
                    padding: EdgeInsets.only(top: responsiveHeight * 0.2),
                    child: const CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: foundCountries.length,
                        itemBuilder: (context, index) {
                          final sortedCountries = foundCountries
                            ..sort((country1, country2) =>
                                country1.country.compareTo(country2.country));
                          return ListTiles(
                            onTap: () {
                              setState(() {
                                selectedCountry =
                                    sortedCountries[index].country;
                                finalFlag = sortedCountries[index].flag;
                                Navigator.pop(context);
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ChooseLocationPage(
                                            initialCountry: selectedCountry,
                                            initialFlag: finalFlag,
                                          ))));
                            },
                            leading: Image.network(
                              sortedCountries[index].flag,
                              width: responsiveWidth * 0.03,
                              height: responsiveHeight * 0.03,
                            ),
                            title: Text(sortedCountries[index].country),
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
