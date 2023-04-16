import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'FormPage.dart';

class InputBlock extends StatefulWidget {
  InputBlock({super.key});

  //map that holds the values of the input block
  final Map<String, dynamic> _formValues = {
    'subject': "",
    'units': 0,
    'dropdownValue': "1",
  };

  //dropdown values
  static final List<String> _dropdownOptions = [
    "1",
    "1.25",
    "1.5",
    "1.75",
    "2",
    "2.25",
    "2.5",
    "2.75",
    "3",
    "5"
  ];

  resetDV() {
    _formValues['dropdownValue'] = "1";
  }

  getBlockValues() {
    return [_formValues['subject'], double.parse(_formValues['dropdownValue']), int.parse(_formValues['units'])];
  }

  @override
  State<InputBlock> createState() => _InputBlockState();
}

class _InputBlockState extends State<InputBlock> {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 170, child: TextFormField(
                  validator: (value) { //validation
                    if (value == null || value.isEmpty) {
                      return 'Enter the  subject';
                    }
                    return null;
                  },
                  decoration:const InputDecoration(labelText: "Subject", border: OutlineInputBorder(), filled: true, fillColor: Color.fromARGB(255, 218, 195, 145)),
                  onChanged: ((String? value) {
                    widget._formValues['subject'] = value; //update the map
                  }),
                )),
        SizedBox(width: 70, child: FormField(
                  builder: (FormFieldState<String> state) {
                    return DropdownButton<String>(
                      value: widget._formValues['dropdownValue'],
                      onChanged: (String? value) {
                        setState(() {
                          widget._formValues['dropdownValue'] = value!; //updates the map
                        });
                      },
                      items: InputBlock._dropdownOptions.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    );
                  },
                  onSaved: ((String? value) {
                    print("Dropdown value saved!");
                  }),
                )),
                SizedBox(width: 70, child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly] ,
                  validator: (value) { //validation
                    if (value == null || value.isEmpty || int.parse(value) > 5 || int.parse(value) < 1 ) { //if value is none or the value is not between 1 and 5
                      return 'Invalid';
                    }
                    return null;
                  },
                  decoration:const InputDecoration(labelText: "Units", border: OutlineInputBorder(), filled: true, fillColor: Color.fromARGB(255, 218, 195, 145)),
                  onChanged: ((String? value) {
                    widget._formValues['units'] = value; //updates the map
                  }),
                )),
      ],),
    );
  }
}

