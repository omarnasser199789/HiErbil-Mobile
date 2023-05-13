import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/app_bar_type3.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> themeItems = ['Auto', 'Dark Mode', 'Light Mode'];
    // String dropdownValue = list.first;
    final List<String> languageItems = ['English', 'كوردي', 'عربي'];
    String? selectedValue;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBarWidgetType3("Settings", context, true, [], null),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height / 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      SvgPicture.asset('assets/svg/language.svg'),
                      const SizedBox(
                        width: 4,
                      ),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: languageItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.black,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    width: 320,
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height / 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Divider(
                color: Colors.black.withOpacity(.4),
              ),
            ),
            SizedBox(height: size.height / 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      SvgPicture.asset('assets/svg/moon.svg'),
                      const SizedBox(
                        width: 4,
                      ),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: themeItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.black,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 300,
                    width: 320,
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
