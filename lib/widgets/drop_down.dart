import 'package:flutter/material.dart';

Widget customDropDown(List<String?> items, String? value, void onChange(val)) {
  print(items);
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: DropdownButton<String>(
      value: value,
      onChanged: (val) {
        onChange(val);
      },
      items: [
        DropdownMenuItem(child: Text(""), value: null),
        ...items.map<DropdownMenuItem<String>>((String? val) {
          final text = val??"";
          return DropdownMenuItem(
            key: UniqueKey(),
            child: Text(text),
            value: val,
          );
        }).toList(),
      ]
    ),
  );
}

class CustomDropDown extends StatelessWidget{
  CustomDropDown(this.items, this.value, this.onChange);

  List<String?> items;
  String? value;
  void Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
          value: value,
          onChanged: (val) {
            onChange(val);
          },
          items: [
            DropdownMenuItem(child: Text(""), value: null),
            ...items.map<DropdownMenuItem<String>>((String? val) {
              final text = val??"";
              return DropdownMenuItem(
                child: Text(text),
                value: val,
              );
            }).toList(),
          ]
      ),
    );
  }
}