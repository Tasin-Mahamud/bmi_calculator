import 'package:bmi_calculator/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';
import "constant.dart";
import 'calculator_brain.dart';
import 'input_page.dart';

class resultbmi extends StatelessWidget {
  resultbmi(
      {required this.bmi_results,
      required this.result_text,
      required this.comment});
  dynamic bmi_results;
  dynamic result_text;
  dynamic comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
              child: const Text(
            "YOUR RESULT",
            style: results_page_top_text_style,
          )),
          Expanded(
            child: containerxd(
                kactivecardcolour, bmi_results, result_text, comment),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: const Text(
                "RE-CALCULATE",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              color: kmybottomcontainerhex,
              height: kmybottomcontainerheight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class containerxd extends StatelessWidget {
  containerxd(
      @required this.colour, this.bmi_val, this.result_text, this.comment);
  final Color colour;
  dynamic bmi_val;
  dynamic result_text;
  dynamic comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              result_text,
              style: results_page_text_style,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Text(
              bmi_val.toString(),
              style: bmi_num_style,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: Text(comment, style: body_weight_review_style),
          ),
        ],
      ),
    );
  }
}
