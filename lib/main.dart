import 'package:bmi_calculator/bmi_calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_card.dart';
import 'contents.dart';
import 'initial_values.dart';
import 'result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color(0xFF090c22)),
          scaffoldBackgroundColor: const Color(0xFF090c22)),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      margin: const EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 15.0),
                      bgColor: selectedGender == GenderType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: const GenderCardContents(
                        text: "MALE",
                        icon: FontAwesomeIcons.mars,
                        txtColor: kTxtColor,
                      )),
                ),
                Expanded(
                  child: ContainerCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    margin: const EdgeInsets.fromLTRB(5.0, 15.0, 15.0, 15.0),
                    bgColor: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const GenderCardContents(
                      text: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                      txtColor: kTxtColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ContainerCard(
                cardChild: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 5.0),
                      child: Text("HEIGHT", style: kHeadingTxtStyle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 0.0, 0, 15.0),
                          child: Text(height.toString(), style: kHeavyTxtStyle),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(fontSize: 18.0, color: kTxtColor),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          overlayColor: kSliderOverlayColor,
                          thumbColor: kCalcButtonColor,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: kTxtColor,
                          trackHeight: 1.0),
                      child: Slider(
                          value: height.toDouble(),
                          onChanged: (updatedValue) {
                            setState(() {
                              height = updatedValue.round();
                            });
                          },
                          min: 54.6,
                          max: 251.0),
                    )
                  ],
                ),
                margin: const EdgeInsets.all(15.0),
                bgColor: kActiveCardColor),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ContainerCard(
                    margin: const EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
                    bgColor: kActiveCardColor,
                    cardChild: bottomCardContents(
                        "WEIGHT", weight, 409, 12, CardType.weight),
                  ),
                ),
                Expanded(
                  child: ContainerCard(
                    margin: const EdgeInsets.fromLTRB(0, 10, 15.0, 10.0),
                    bgColor: kActiveCardColor,
                    cardChild:
                        bottomCardContents("AGE", age, 101, 5, CardType.age),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    CalculatorBrain brain = CalculatorBrain(height: height, weight: weight);
                    String result = brain.getResult();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(result: result, status: brain.getStatus(), interpretation: brain.getInterpretation(),)));
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(kCalcButtonColor)),
                  child: const Center(
                      child: Text(
                    "CALCULATE YOUR BMI",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
                  )),
                ),
              ))
        ],
      ),
    );
  }

  Column bottomCardContents(String headingText, int value, int maxValue,
      int minValue, CardType card) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Text(headingText, style: kHeadingTxtStyle),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25.0),
          child: Text(
            value.toString(),
            style: kHeavyTxtStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              fillColor: kRoundButtonFillColor,
              height: 60.0,
              width: 60.0,
              icon: const Icon(FontAwesomeIcons.minus),
              callback: () {
                setState(() {
                  value = value > minValue ? value - 1 : minValue;
                  card == CardType.weight ? weight = value : age = value;
                });
              },
            ),
            const SizedBox(width: 15.0),
            RoundButton(
              fillColor: kRoundButtonFillColor,
              height: 60.0,
              width: 60.0,
              icon: const Icon(FontAwesomeIcons.plus),
              callback: () {
                setState(() {
                  value = value < maxValue ? value + 1 : maxValue;
                  card == CardType.weight ? weight = value : age = value;
                });
              },
            )
          ],
        )
      ],
    );
  }
}
