import 'package:bmi_calculator/container_card.dart';
import 'package:bmi_calculator/initial_values.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  final String result;
  final String status;
  final String interpretation;

  const ResultPage(
    { super.key,
      required this.result,
      required this.status,
      required this.interpretation,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("BMI Calculator")),
          automaticallyImplyLeading: false),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 0, 30.0),
            child: Text(
              "Your Result",
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Expanded(
            flex: 8,
            child: ContainerCard(
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 45.0),
                          child: Center(
                              child: Text(
                            status,
                            style: kResultStatusTxtStyle,
                          ))),
                    ),
                    Expanded(
                        flex: 5,
                        child: Center(
                            child: Text(result, style: kResultTxtStyle))),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 0 , 15.0, 0),
                          child: Text(
                            interpretation,
                            style: kMessageTxtStyle,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 100),
                bgColor: kActiveCardColor)),
        Expanded(
            flex: 1,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(kCalcButtonColor)),
                child: const Center(
                    child: Text(
                  "RECALCULATE YOUR BMI",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
                )),
              ),
            ))
      ]),
    );
  }
}
