import '../functionality/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../functionality/reuseble_card.dart';
import '../functionality/custom_widget.dart';
import '../functionality/constants.dart';
import 'result_page.dart';

// Color maleCurrentColor = inActiveCardColor;
// Color femaleCurrentColor = inActiveCardColor;
enum Gender { male, female }

// void updateColor(Gender gender) {
//   gender == Gender.male && maleCurrentColor == inActiveCardColor
//       ? maleCurrentColor = activeCardColor
//       : maleCurrentColor = inActiveCardColor;
//   gender == Gender.female && femaleCurrentColor == inActiveCardColor
//       ? femaleCurrentColor = activeCardColor
//       : femaleCurrentColor = inActiveCardColor;
// }
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 55;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(),
        ),
        centerTitle: true,
        elevation: 7.0,
        bottomOpacity: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    pressKaro: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    // colour: maleCurrentColor,
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: const ChildWidgetCustom(
                      icony: FontAwesomeIcons.person,
                      texty: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusebleCard(
                    pressKaro: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    // colour: femaleCurrentColor,
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInActiveCardColor,
                    cardChild: const ChildWidgetCustom(
                      icony: FontAwesomeIcons.personDress,
                      texty: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Height',
                            style: kTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumberStyle,
                              ),
                              Text(
                                'CM',
                                style: kTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                }),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundCustomBut(
                              icon: FontAwesomeIcons.plus,
                              onpresseD: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            MyRoundCustomBut(
                              icon: FontAwesomeIcons.minus,
                              onpresseD: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusebleCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundCustomBut(
                              icon: FontAwesomeIcons.plus,
                              onpresseD: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            MyRoundCustomBut(
                              icon: FontAwesomeIcons.minus,
                              onpresseD: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
            buttonName: 'CALCULATE',
            onPressedd: () {
              BmiBrain bmiBrain = BmiBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            getBmiResult: bmiBrain.getBmiResult(),
                            getResultClassification:
                                bmiBrain.getResultClassification(),
                            getResultDetails: bmiBrain.getResultDetails(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
