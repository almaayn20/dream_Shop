import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class DropDownMenuCustom extends StatelessWidget {
  final Map<dynamic, String> entries;
  final TextEditingController controller; //= TextEditingController();
  final String label;

  //Function selectedIndex;
  // final IconData icon;

  DropDownMenuCustom(this.entries, this.label, this.controller, {super.key});

  List<DropdownMenuEntry> assign() {
    List<DropdownMenuEntry> customEntries = [];
    customEntries = entries.entries.map((entry) {
      return DropdownMenuEntry(
        value: entry.key,
        label: entry.value,
      );
    }).toList();
    return customEntries;
  }

  DropdownMenu dropDownMenu() {
    return DropdownMenu(
      //     trailingIcon: Icon(icon),
      controller: controller,
      label: Text(label),
      width: SizeConfig.width * 0.9,
      dropdownMenuEntries: assign(),
      onSelected: (val) {
        controller.text = val.toString();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return dropDownMenu();
  }
}

// الاستدعاء
/*            
List<Tuple2<dynamic, String>> bankEntries = const [
    Tuple2(1, 'الكريمي'),
    Tuple2(2, 'التضامن'),
    Tuple2(2, 'البنك التجاري'),
  ];
DropDownMenuCustom(bankEntries, "Banks"),
 */
