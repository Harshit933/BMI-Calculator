import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'roundicon_button.dart';
import 'calculator_brain.dart';

enum GenderType{
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      selectedGender == GenderType.male ? kInActiveCardColour : kActiveCardColour,
                      Content(FontAwesomeIcons.venus,'MALE'),
                        () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                        }
                    ),
                  )
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      selectedGender == GenderType.female ? kInActiveCardColour : kActiveCardColour,
                      Content(FontAwesomeIcons.mars,'FEMALE'),
                        (){
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                        }
                    ),
                  )
                ],
              ))
            ],
          )),
          Expanded(child: ReusableCard(
            kActiveCardColour,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kstyle,
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E89),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue){
                      print(newValue);
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),

              (){

              }
          )
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      kActiveCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                opressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                  },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                opressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                  },
                              ),
                            ],
                          )
                        ],
                      ),
                        (){}
                    ),
                  )
                ],
              )),
              Expanded(child:
              ReusableCard(kActiveCardColour, Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AGE',
                    style: labelTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.plus, opressed: (){
                        setState(() {
                          age++;
                        });
                      }),
                      SizedBox(width: 10.0),
                      RoundIconButton(icon: FontAwesomeIcons.minus, opressed: (){
                        setState(() {
                          age--;
                        });
                      })
                    ],
                  )
                ],
              ), (){},),)
            ],
          )),
          BottomButton( buttonTitle: 'CALCULATE', onTap: (){

            CalculatorBrain calc = CalculatorBrain(height, weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(calc.calculateBMI(),calc.getResult(),calc.getInterpretation())));
            },
          )
        ],
      )
    );
  }
}


