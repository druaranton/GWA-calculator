

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'InputBlock.dart';

class FormPage extends StatefulWidget {
  FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<InputBlock> inputBlockList = [InputBlock()]; //list of input blocks which contains widgets

  //function to add inputblocks into the list/for the dynamic adding of fields
  _addToInputsList() {
    setState(() {
      inputBlockList.add(InputBlock()); //add instance of input block to the list
    });
  }

  //function to compute the GWA
  _computeGWA() {
    if(_formKey.currentState!.validate()) { //validate the form
      _formKey.currentState!.save(); //save
      double gwa; //for gwa
      double totalGrade = 0; //for total grade
      int totalUnits = 0; //for totalUnits

      for(int i = 0; i< inputBlockList.length; i++) { //traverse the list
        // print(inputBlockList[i].info.getValues()); 
        totalGrade = totalGrade + (inputBlockList[i].getBlockValues()[1] * inputBlockList[i].getBlockValues()[2]); //grades * units
        totalUnits += inputBlockList[i].getBlockValues()[2] as int; //summation of the units
      }
      gwa = totalGrade  / totalUnits; //computes for the gwa
      print(gwa);
      setState(() {
        summaryVar = _buildSummary(gwa); //updates the summary variable to refect
      });
      
    }
    
  }

  //function to build the summary
  Widget _buildSummary(double gwa) {
    List<Widget> blockWidget = []; //list of the blockinputs
    for(int i = 0; i< inputBlockList.length; i++) { //traverse the list
        // print(inputBlockList[i].getBlockValues());
        blockWidget.add(Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Text(inputBlockList[i].getBlockValues()[0], style: TextStyle(fontSize: 20),),Text(inputBlockList[i].getBlockValues()[1].toString(), style: TextStyle(fontSize: 20),),Text(inputBlockList[i].getBlockValues()[2].toString(), style: TextStyle(fontSize: 20),)],),
        )); //add the values
      }
    //return the widget containing the summary
    return Center(child:
      Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [const Text("Summary", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)), Column(children: blockWidget,), Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text("GWA",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),), Text(gwa.toString(),style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)],)]),
    );
  }

  //function to reset the form
  _resetForm() {
    setState(() {
      inputBlockList.clear(); //clear the list
      _formKey.currentState!.reset(); //reset the fields
      summaryVar = Container(); //empties the summary variable
      _addToInputsList();
      inputBlockList[0].resetDV();
    });
  }

  final _formKey = GlobalKey<FormState>(); //form key

  Widget summaryVar = Container(); //summary variable that stores the summary

  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey,
    child:ListView(children: [Column(mainAxisAlignment: MainAxisAlignment.center, children: inputBlockList), 
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: [OutlinedButton(style: OutlinedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 218, 195, 145),), onPressed: _addToInputsList, child: const Text("Add Subject")),
          OutlinedButton(style: OutlinedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 218, 195, 145),), onPressed: _computeGWA, child: const Text("Compute")),],
          ), const Divider(color: Colors.black, thickness: 2),summaryVar,  Center(child: OutlinedButton(style: OutlinedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 218, 195, 145),), onPressed: _resetForm, child: const Text("Reset")))
    ],));
  }
}